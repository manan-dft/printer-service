package com.dft.secure.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.AffineTransform;
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

//                BufferedImage image1 = rotateBy(image, 180);
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

    public static BufferedImage rotateBy(BufferedImage source, double degrees) {
        // The size of the original image
        int w = source.getWidth();
        int h = source.getHeight();
        // The angel of the rotation in radians
        double rads = Math.toRadians(degrees);
        // Some nice math which demonstrates I have no idea what I'm talking about
        // Okay, this calculates the amount of space the image will need in
        // order not be clipped when it's rotated
        double sin = Math.abs(Math.sin(rads));
        double cos = Math.abs(Math.cos(rads));
        int newWidth = (int) Math.floor(w * cos + h * sin);
        int newHeight = (int) Math.floor(h * cos + w * sin);

        // A new image, into which the original can be painted
        BufferedImage rotated = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = rotated.createGraphics();
        // The transformation which will be used to actually rotate the image
        // The translation, actually makes sure that the image is positioned onto
        // the viewable area of the image
        AffineTransform at = new AffineTransform();
        at.translate((newWidth - w) / 2, (newHeight - h) / 2);

        // And we rotate about the center of the image...
        int x = w / 2;
        int y = h / 2;
        at.rotate(rads, x, y);
        g2d.setTransform(at);
        // And we paint the original image onto the new image
        g2d.drawImage(source, 0, 0, null);
        g2d.dispose();

        return rotated;
    }
}
