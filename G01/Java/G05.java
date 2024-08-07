// 853355 Davi Puddo
public class G05
{
	// Converter ASCII para hexadecimal
	public static char[] ASCII2hex (char[] x)
	{
		char [] result = null;
		if (x != null)
		{
			result = new char[x.length*2];
			
			if (result != null)
			{
				for (int i = 0; i < x.length; i++)
				{
					int buffer_1 = (int)(x[i] / 16.0);
					int buffer_2 = (int)(x[i] % 16.0);
					
					int type = 48;
					if (buffer_1 >= 10)
					{
						type = 55;
					}
					result[2*i] = (char)(buffer_1 + type);

					type = 48;
					if (buffer_2 >= 10)
					{
						type = 55;
					}
					result[(2*i)+1] = (char)(buffer_2 + type);
				}
			}
		}
		return (result);
	}

	// Converter hexadecimal para ASCII
	public static char[] hex2ASCII (char [] x)
	{
		char[] result = null;
		if (x != null)
		{
			result = new char[(int)(x.length / 2.0)];
			if (result != null)
			{
				for (int i = 0; i < result.length; i++)
				{
					int buffer_1 = 0;
					int buffer_2 = 0;
					int first = x[2*i];
					int second = x[(2*i)+1];

					if (first >= 65)
					{
						buffer_1 = (int)(first - 55);
					}
					else
					{
						buffer_1 = (int)(first - 48);
					}
					buffer_1 = (buffer_1 * 16);
					
					if (second >= 65)
					{
						buffer_2 = (int)(second - 55);
					}
					else
					{
						buffer_2 = (int)(second - 48);
					}

					result[i] = (char)(buffer_1 + buffer_2);
				}
			}
		}
		return (result);
	}
	
	// Mostrar arrays
	public static void print (char [] x) 
	{
		for (int i = 0; i < x.length; i++)
		{
			System.out.print (x[i]);
			if (i % 2 != 0)
			{
				System.out.print(' ');
			}
		}
		System.out.print ("\n");
	}

	public static void main (String[] args)
	{
		char [] data_1 = {'P','U','C','-','M','.','G','.'};
		char [] data_2 = {'2','0','2','4','-','0','2'};
		char [] x = null;

		x = ASCII2hex(data_1);
		print(x);

		x = ASCII2hex(data_2);
		print(x);

		x = hex2ASCII(x);
		for (int i = 0; i < x.length; i++)
		{
			System.out.print(x[i]);
		}
		System.out.println();
	}
}
