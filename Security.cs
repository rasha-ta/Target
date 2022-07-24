using System;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;



	
	public class Security
	{
		
		public static string Encrypt(string cleanString)
		{
			Byte[] clearBytes = new UnicodeEncoding().GetBytes(cleanString);
			Byte[] hashedBytes = ((HashAlgorithm) CryptoConfig.CreateFromName("MD5")).ComputeHash(clearBytes);
			
			return BitConverter.ToString(hashedBytes);
		}
	}

