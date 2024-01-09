namespace UcenjeCS
{
    internal class V01ZimskoVjezbanje
    {
        public static void Izvedi()
        {
            // 1. Napisati program koji ispisuje sve brojeve od 1 do 100

            //for (int i = 1; i <= 100; i++) 
            //{
            //    Console.WriteLine(i);
            //}


            // 2. Napisati program koji ispisuje sve brojeve od 100 do 1 

            //for (int i = 100; i > 0; i--)
            //{
            //    Console.WriteLine(i);
            //}


            // 3. Napisati program koji ispisuje sve brojeve od 1 do 100 koji su cjelobrojno djeljivi s 7

            //for (int i  = 1; i <= 100;  i++)
            //{
            //    if (i%7 == 0)
            //    {
            //        Console.WriteLine(i);
            //    }
            //}


            // 4. Napisati program koji unosi brojeve sve dok ne unese broj veći od 100, a zatim ispisuje koliko je bilo pokušaja unosa

            int targetNumber = 100;
            int attempts = 0;
            int userInput;

            do
            {
                Console.Write("Unesite broj veći od 100: ");

                if (int.TryParse(Console.ReadLine(), out userInput))
                {
                    attempts++;

                    if (userInput <= targetNumber)
                    {
                        Console.WriteLine("Niste unijeli broj veći od 100, pokušajte ponovno. ");
                    }
                    else
                    {
                        Console.WriteLine($"Vaš broj je: {userInput}.");
                    }
                }
                else
                {
                    attempts++;
                    Console.WriteLine("Niste unijeli cjelobrojni broj, pokušajte ponovno. ");
                }

            } while (userInput <= targetNumber);

            Console.WriteLine($"Trebalo vam je {attempts} puta da unesete broj veći od {targetNumber}.");




        }
    }
}
