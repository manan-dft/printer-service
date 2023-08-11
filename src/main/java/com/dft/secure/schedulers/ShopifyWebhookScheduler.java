package com.dft.secure.schedulers;

import com.dft.secure.util.PNGFilePrintable;
import com.dft.secure.util.QrCodeService;
import com.google.zxing.WriterException;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.print.PageFormat;
import java.awt.print.Paper;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@Log4j2
@Component
@RequiredArgsConstructor
public class ShopifyWebhookScheduler {

    private final QrCodeService qrCodeService;
    private final String FILE_DIRECTORY = "./";

    private final String uri = "https://apps.shineauto.com.au/zoho/getQrList?user=grp1";

    public static String printer(String filePath, String printerName)
        throws IOException, PrinterException {

        String flag;

        PrintService myPrintService = findPrintService(printerName);
        PrinterJob job = PrinterJob.getPrinterJob();

        PageFormat pageFormat1 = job.defaultPage();
        pageFormat1.setOrientation(PageFormat.LANDSCAPE);

        Paper paper = new Paper();

        double paperWidth = 4 * 72.0; // 4 inches
        double paperHeight = 6 * 72.0; // 6 inches
        double bottomMargin = 2 * 72.0; // 0.5 inches bottom margin
        paper.setSize(paperWidth, paperHeight);
        paper.setImageableArea(0, 0, paperWidth, paperHeight - bottomMargin); // Subtract the bottom margin

        pageFormat1.setPaper(paper);

        job.setPrintable(new PNGFilePrintable(filePath), pageFormat1);
        job.setPrintService(myPrintService);
        job.print();
        System.out.println("printed!!");
        flag = "Success";

        return flag;
    }

    private static PrintService findPrintService(String printerName) {
        PrintService[] printServices = PrintServiceLookup.lookupPrintServices(
            null, null);
        for (PrintService printService : printServices) {
            log.debug("Printer service: {}", printService);

            if (printService.getName().endsWith("(Zebra)")) {
                log.debug("Found printer printing the QR code");
                return printService;
            }
        }

        log.debug("Default printer: {}", PrintServiceLookup.lookupDefaultPrintService().getName());
        return PrintServiceLookup.lookupDefaultPrintService();
    }

    public static void createPNGFileFromByteArray(byte[] data, String filePath) throws IOException {
        try (FileOutputStream fos = new FileOutputStream(filePath)) {
            fos.write(data);
        }
    }

    public static Font findFontSize(Graphics2D g2d, String text, int desiredWidth, int desiredHeight) {
        int fontSize = 1;
        Font font;

        do {
            font = new Font("Arial", Font.BOLD, fontSize);
            g2d.setFont(font);

            FontMetrics fontMetrics = g2d.getFontMetrics();
            int textWidth = fontMetrics.stringWidth(text);
            int textHeight = fontMetrics.getHeight();

            if (textWidth <= desiredWidth && textHeight <= desiredHeight) {
                fontSize++;
            } else {
                break;
            }
        } while (true);

        return font;
    }

    @Scheduled(fixedRate = 3, timeUnit = TimeUnit.SECONDS)
    public void processShopifyWebhooksScheduler() throws WriterException, IOException {
        log.debug("[processShopifyWebhooksScheduler] Entered");
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(uri);
        String responseBody = "";

        try {
            HttpResponse response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();

            if (entity != null) {
                responseBody = EntityUtils.toString(entity);
                log.debug("API response: {}", responseBody);
            }
        } catch (Exception exception) {
            log.error("Exception occurred while calling getQRInput API. Error Message: {}", exception.getMessage(), exception);
        }

        if (responseBody == null || responseBody.trim().isEmpty()) {
            return;
        }

        String[] split = responseBody.split(",");
        log.debug("QR request size: {}", split.length);

        for (String qrRequest : split) {
            BufferedImage qrCodeImage = qrCodeService.generateQRCodeImage(qrRequest, 220, 220);
            BufferedImage combinedImage = combineImages(qrCodeImage, qrRequest);

            byte[] bytes = qrCodeService.convertToByteArray(combinedImage);
            String filePath = System.getProperty("java.io.tmpdir").concat("/qr1.png");
            log.debug("temp path :{}", filePath);

            try {
                createPNGFileFromByteArray(bytes, filePath);
                System.out.println("PNG file created successfully.");
            } catch (IOException e) {
                System.err.println("Error creating PNG file: " + e.getMessage());
            }

            String printerName = "Canon G200";

            try {
                String print = printer(filePath, printerName);
                System.out.println("Auto printed of pdf file" + print);
            } catch (Exception exception) {
                log.error("Exception occurred while printing. Error Message: {}", exception.getMessage(), exception);
            }
        }
    }

    private String generateFileName() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        String currentDate = dateFormat.format(new Date());
        return FILE_DIRECTORY + currentDate + ".txt";
    }

    private void writeToFile(String fileName, String content) throws IOException {
        if (Files.exists(Paths.get(fileName))) {
            try (FileWriter writer = new FileWriter(fileName, true)) {
                writer.write(content + System.lineSeparator());
            }
        } else {
            Files.createDirectories(Paths.get(FILE_DIRECTORY));
            try (FileWriter writer = new FileWriter(fileName, true)) {
                writer.write(content + System.lineSeparator());
            }
        }
    }

    private BufferedImage combineImages(BufferedImage qrCodeImage, String text) {
        int desiredWidth = 220;
        int desiredHeight = 80;

        BufferedImage image = new BufferedImage(desiredWidth, desiredHeight, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = image.createGraphics();

        // Set background color
        g2d.setColor(Color.WHITE);
        g2d.fillRect(0, 0, desiredWidth, desiredHeight);

        // Set text color and find appropriate font size
        g2d.setColor(Color.BLACK);
        Font font = findFontSize(g2d, text, desiredWidth, desiredHeight);
        g2d.setFont(font);

        FontMetrics fontMetrics = g2d.getFontMetrics();
        int x = (desiredWidth - fontMetrics.stringWidth(text)) / 2;
        int y = (desiredHeight - fontMetrics.getHeight()) / 2 + fontMetrics.getAscent();

        g2d.drawString(text, x, y);
        g2d.dispose();


        BufferedImage mergedImage = new BufferedImage(
            qrCodeImage.getWidth(),
            qrCodeImage.getHeight() + image.getHeight(),
            BufferedImage.TYPE_INT_RGB
        );

        g2d = mergedImage.createGraphics();
        g2d.drawImage(qrCodeImage, 0, 0, null);
        g2d.drawImage(image, 0, qrCodeImage.getHeight(), null);
        g2d.dispose();
        return mergedImage;
    }
}