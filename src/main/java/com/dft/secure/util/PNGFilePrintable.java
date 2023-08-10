package com.dft.secure.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.print.PageFormat;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.io.IOException;

public class PNGFilePrintable implements Printable {

    private String filePath;

    public PNGFilePrintable(String filePath) {
        this.filePath = filePath;
    }

    @Override
    public int print(Graphics graphics, PageFormat pageFormat, int pageIndex) throws PrinterException {
        if (pageIndex > 0) {
            return Printable.NO_SUCH_PAGE;
        }

        try {
            Graphics2D g2d = (Graphics2D) graphics;
            g2d.translate(pageFormat.getImageableX(), pageFormat.getImageableY());

            BufferedImage image = ImageIO.read(new java.io.File(filePath));
            if (image != null) {
                double paperWidth = pageFormat.getImageableWidth();
                double paperHeight = pageFormat.getImageableHeight();

                double leftMargin = 10;     // Adjust the left margin size
                double rightMargin = 10;    // Adjust the right margin size
                double topMargin = 22;      // Adjust the top margin size
                double bottomMargin = 48;   // Adjust the bottom margin size
                double availableWidth = paperWidth - leftMargin - rightMargin;
                double availableHeight = paperHeight - topMargin - bottomMargin;

                // Calculate the scale factors to fit the image into the available dimensions
                double scaleX = availableWidth / image.getWidth();
                double scaleY = availableHeight / image.getHeight();
                double scale = Math.min(scaleX, scaleY);

                int scaledWidth = (int) (image.getWidth() * scale);
                int scaledHeight = (int) (image.getHeight() * scale);

                int x = (int) (leftMargin + (availableWidth - scaledWidth) / 2);
                int y = (int) (topMargin + (availableHeight - scaledHeight) / 2);

                g2d.drawImage(image, x, y, scaledWidth, scaledHeight, null);

                return Printable.PAGE_EXISTS;
            } else {
                return Printable.NO_SUCH_PAGE;
            }
        } catch (IOException e) {
            e.printStackTrace();
            return Printable.NO_SUCH_PAGE;
        }
    }
}
