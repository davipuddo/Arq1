//853355 Davi Puddo

public class G0202
{
	// Converter um valor real para binario
	public static char[] double2bin (char[] data)
	{
		char[] result = null;

		if (data != null)
		{
			result = new char[16];

			if (result != null)
			{

			}
		}

		return (result);
	}

	public static void print (char[] s)
	{
		for (int i = 0; i < s.length; i++)
		{
			System.out.print (s[i]);
		}
		System.out.println("");
	}

	public static void main (String[] args)
	{
		char[] res = null;
		double data = 6.375000;

		res = double2bin(data);
		print (res);
	}
}
