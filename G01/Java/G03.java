//853355 Davi Ferreira Puddo

public class G03
{
    // Converter decimal para base [n] ate 16 (menos binario)
    public static char[] dec2baseN (int x, int base)
    {
        char[] result = null;
        int tmp = 0;

        result = new char[10 - (int)(base/3.0)];  // Tamanho semi-flexivel [sujeito a erro]

        if (result != null)
        {
            tmp = x;
            int pos = 0;

            for (int i = result.length; i >= 0; i--)
            {
                int power = (int)Math.pow(base, i);    // Pontencia
                int y = base-1;                        // Valor na casa
                int PrevPos = pos;

                while (y > 0 && PrevPos == pos) 
                {
                    if (tmp >= power*y)
                    {
                        tmp = tmp - power*y;
                        if (y <= 10)
                        {
                            result[pos] = (char)(y + 48);
                        }
                        else
                        {
                            result[pos] = (char)(y + 55);
                        }
                        pos++;
                    }
                    y--;
                }
            }
        }
        return (result) ;
    }

    // Mostrar array
    public static void print (char[] data, int x, int base)
    {
        System.out.print(x + " ("+ base + ") " + "= ");
        for (int i = 0; i < data.length; i++)
        {
            System.out.print(data[i]);
        }
        System.out.print(" (" + base + ")\n");
    }

    public static void main (String[] args)
    {
        char [] res = dec2baseN(26, 2); // Nao funciona
        print(res, 26, 2);

        res = dec2baseN(61, 4);
        print(res, 61, 4);

        res = dec2baseN(53, 8);
        print(res, 53, 8);

        res = dec2baseN(77, 10);
        print(res, 77, 10);

        res = dec2baseN(153, 16);
        print(res, 153, 16);

        res = dec2baseN(753, 16);
        print(res, 753, 16);


        res = null;
    }
}