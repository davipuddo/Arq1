// 853355 Davi Ferreira Puddo

public class G02 
{   
    // Converter inteiro para binario
    public static int bin2dec (byte [] x)
    {
        int result = 0;
        for (int i = 0; i < x.length; i++)
        {
            if (x[i] == 1)
            {
                result = result + (int)Math.pow(2, x.length-1-i);
            }
        }
        return result;
    }

    public static void print (byte [] x)
    {
        for (int i = 0; i < x.length; i++)
        {
            System.out.print(x[i]);
        }
        int res = bin2dec(x);
        System.out.print(" = " + res + "\n");
    }

    public static void main (String[] args)
    {   
        // Definir valores
        byte[] a = {1,0,1,0,1};
        byte[] b = {1,1,0,1,1};
        byte[] c = {1,0,0,1,0};
        byte[] d = {1,0,1,0,1,1};
        byte[] e = {1,1,0,1,1,1};

        // Mostrar resultado
        print(a);
        print(b);
        print(c);
        print(d);
        print(e);
    }
}