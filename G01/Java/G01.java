// 853355 Davi Ferreira Puddo

public class G01
{   
    // Encontrar tamanho 
    public static int FindSize (int x)
    {
        int result = 0;
    
        while (x > Math.pow(2, result))
        {
            if (result == 0)
            {
                result = 1;
            }
            else
            {
                result++;
            }
        }
        return result;
    }

    // Converter inteiro para binario
    public static byte[] dec2bin (int x)
    {
        byte [] result = null;
        int size = FindSize(x);
        result = new byte[size];
        
        int tmp = x;
        for (int i = 0; i < size; i++)
        {
            if (tmp >= (int)Math.pow(2, (size -1) - i))
            {
                tmp = tmp - (int)Math.pow(2, (size -1) - i);
                result[i] = 1;
            }
        }
        return result;
    }

    public static void main (String[] args)
    {   
        // Definir valores
        int value = 26;
        int size = FindSize(value);

        // Converter para binario
        byte [] res = dec2bin(value);

        // Mostrar resultado
        System.out.print(value + " = ");
        for (int i = 0; i < size; i++)
        {
            System.out.print(res[i]);
        }
        System.out.println("");

        // Definir valores
        value = 713;
        size = FindSize(value);

        // Converter para binario
        res = dec2bin(value);

        // Mostrar resultado
        System.out.print(value + " = ");
        for (int i = 0; i < size; i++)
        {
            System.out.print(res[i]);
        }
        System.out.println("");
    }
}