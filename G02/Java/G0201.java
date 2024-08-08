// 853355 Davi Puddo

public class G0201
{
	// Converter um valor em binario para real
	public static double bin2double (char[] bi)
	{
		double result = 0.0;
		if (bi != null)
		{
			double buffer = 0.0;
			int i = 0;	
			
			while (i < bi.length && bi[i] != '.')		 // Encontrar virgula
			{
				i++;
			}

			if (i < bi.length)
			{
				int w = 0;
				for (int y = i-1; y >= 0; y--) 			 // Valor antes da virgula
				{
					buffer = Math.pow(2, w);
					if (bi[y] == '1')
					{
						result = result + buffer;
					}
					w++;
				}
				
				w = -1;
				for (int y = i+1; y < bi.length; y++)	 // Valor depois da virgula
				{
					buffer = Math.pow(2, w);
					if (bi[y] == '1')
					{
						result += buffer;
					}
					w--;
				}
			}
			else
			{	
				// Numero fornecido nao apresenta virgula
				// Fazer conversao normal de binario
			}
		}
		return (result);
	}

	// Mostrar dados
	public static void print (char[] data, double res)
	{
		for (int i = 0; i < data.length; i++)
		{
			System.out.print (data[i]);
		}
		System.out.println(" = " + res);
	}

	public static void main (String[] args)
	{

		// Definir dados
		char[] data_1 = {'0','.','0','0','0','1','1'};
		char[] data_2 = {'0','.','0','1','0','0','1'};
		char[] data_3 = {'0','.','1','0','1','0','1'};
		char[] data_4 = {'1','.','1','1','1','0','1'};
		char[] data_5 = {'1','1','.','1','1','0','0','1'};
		
		// Apresentacao
		System.out.println("G0201 -");

		// Mostrar dados
		print (data_1, bin2double(data_1));
		print (data_2, bin2double(data_2));
		print (data_3, bin2double(data_3));
		print (data_4, bin2double(data_4));
		print (data_5, bin2double(data_5));	
	}
}
