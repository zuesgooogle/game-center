package com.simplegame.platform.utils;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

import sun.misc.BASE64Encoder;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

/**
 * 
 * @author zeusgoogogle@gmail.com
 * @sine 2015年3月15日 上午10:59:43
 * 
 */
public class QRCodeUtils {

    @SuppressWarnings("restriction")
    public static String createQRCode(String content) {
        MultiFormatWriter multiFormatWriter = new MultiFormatWriter();

        Map<EncodeHintType, String> hints = new HashMap<EncodeHintType, String>();
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");

        try {
            BitMatrix bitMatrix = multiFormatWriter.encode(content, BarcodeFormat.QR_CODE, 400, 400, hints);

            ByteArrayOutputStream bs = new ByteArrayOutputStream();

            ImageOutputStream imOut;

            imOut = ImageIO.createImageOutputStream(bs);

            BufferedImage image = ImageUtils.toBufferedImage(bitMatrix);
            ImageIO.write(image, "JPG", imOut);

            BASE64Encoder encoder = new BASE64Encoder();
            return encoder.encode(bs.toByteArray());
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
}
