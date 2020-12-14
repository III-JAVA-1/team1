package com.web.pet.util;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;

public class BlobToByteArray {
	
	public static byte[] blobToByteArray(Blob blob) {//把資料庫圖片寫出來
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); 
			ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
