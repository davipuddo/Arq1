public class G04
{
	public static char[] ASCII2hex (char[] x)
	{
		char [] result = null;
		if (x != null)
		{
			if (x.length % 2 != 0)
			{
				char[] tmp = null;
				tmp = new char [(int)((x.length+1)/2.0)];

				if (buffer != null)
				{
					for (int i = 0; i < x.length; i++)
					{
						tmp[i] = x[i]; 
					}
					tmp[x.length] = 0;
					result = buffer;
					tmp = null;
				}
			}
			else
			{
				result = new char [(int)(x.length)/2.0];
			}

			if (result != null)
			{
				int buffer = 0;

				for (int i = 0; i < x.length; i++)
				{
					for (int y = 0; y < 16; y++)
					{
						
					}
				}
			}
		}
		return (result);
	}

	public static void print (char [] x, int size) 
	{
		for (int i = 0; i < size; i++)
		{
			System.out.print (x[i]);
		}
		System.out.print ("\n");
	}

	public static void main (String[] args)
	{
		char [] x = null;
		x = ASCII2hex()	
	}
}
