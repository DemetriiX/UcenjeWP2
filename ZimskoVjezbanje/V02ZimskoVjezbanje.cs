using Microsoft.AspNetCore.Mvc;
using System.Text;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("V02")]
    public class V02ZimskoVjezbanje:ControllerBase
    {
        [HttpGet]
        [Route("zad1")]
        public IActionResult GetSum()
        {
            // Ruta ne prima niti jedan parametar i vraća zbroj prvih 100 brojeva
            int sum = 0;
            for (int i = 1;  i <= 100; i++) 
            {
                sum += i;
            }

            return Ok(sum);
        }

        [HttpGet]
        [Route("zad2")]

        public IActionResult GetEvenNumbers()
        {
            // Ruta ne prima niti jedan parametar i vraća niz s svim parnim brojevima od 1 do 57            
            int[] evenNumbers = Enumerable.Range(1, 57).Where(x => x % 2 == 0).ToArray();

            return Ok(evenNumbers);

        }

        [HttpGet]
        [Route("zad3")]

        public IActionResult GetEvenSum()
        {
            // Ruta ne prima niti jedan parametar i vraća zbroj svih parnih brojeva od 2 do 18

            int sum = 0;
            for (int i = 2; i <= 18 && i % 2 == 0; i += 2)
            {
                sum += i;
            }

            return Ok(sum);
        }

        [HttpGet]
        [Route("zad4")]

        public IActionResult GetUserSum(int broj)
        {
            // Ruta prima jedan parametar koji je cijeli broj i vraća zbroj svih brojeva od 1 do primljenog broja            

            int sum = 0;
            for (int i = 0; i <= broj; i++)
            {
                sum += i;
            }

            return Ok(sum);
        }

        [HttpGet]
        [Route("zad5")]

        public IActionResult GetTwoUser(int broj1, int broj2)
        {
            // Ruta prima dva parametra koji su cijeli brojevi i vraća niz s svim parnim brojevima između primljenih brojeva
            // PITAJ PROFESORA - npr. sa "25" kao drugi broj, vrati "26" kao zadnji broj

            int[] evenNumbers = Enumerable.Range(broj1, broj2).Where(x => x % 2 == 0).ToArray();

            return Ok(evenNumbers);

        }

        [HttpGet]
        [Route("zad6")]

        public IActionResult GetAnotherTwoUser(int broj1, int broj2)
        {
            // Ruta prima dva parametra koji su cijeli brojevi i vraća niz s svim neparnim brojevima između primljenih brojeva

            int[] oddNumbers = Enumerable.Range(broj1, broj2).Where(x => x % 2 != 0).ToArray();

            return Ok(oddNumbers);
        }

        [HttpGet]
        [Route("zad7")]

        public IActionResult GetMoreTwoUser(int broj1, int broj2)
        {
            // Ruta prima dva parametra koji su cijeli brojevi i vraća zbroj svih brojeva između primljenih brojeva

            int sum = 0;
            for (int i = broj1; i <= broj2; i++)
            {
                sum += i;
            }

            return Ok(sum);
        }

        [HttpGet]
        [Route("zad8")]

        public IActionResult GetTwoUserAgain(int broj1, int broj2)
        {
            // Ruta prima dva parametra koji su cijeli brojevi i vraća zbroj svih brojeva između primljenih brojeva koji su cjelobrojno djeljivi s 3

            int sum = 0;
            for (int i = broj1; i <= broj2; i++)
            {
                if (i % 3 == 0)
                {
                    sum += i;
                }               
            }

            return Ok(sum);
        }

        [HttpGet]
        [Route("zad9")]

        public IActionResult GetSumDivisible(int broj1, int broj2)
        {
            // Ruta prima dva parametra koji su cijeli brojevi i vraća zbroj svih brojeva između primljenih brojeva koji su cjelobrojno djeljivi s 3 i 5

            int sum = 0;
            for (int i = broj1; i <= broj2; i++)
            {
                if (i % 3 == 0 && i % 5 == 0)
                {
                    sum += i;
                }
            }

            return Ok(sum);
        }

        [HttpGet]
        [Route("zad10")]

        public IActionResult GetTable(int DoKojegBroja, int DoKolikoPutaSeMnozi)
        {
            // Ruta prima dva parametra koji su cijeli brojevi i vraća dvodimenzionalni niz (matricu) koja sadrži tablicu množenja za dva primljena broja

            //int[,] multiplicationTable = new int[DoKojegBroja,DoKolikoPutaSeMnozi];

            //for (int i = 1; i <= DoKojegBroja; i++)
            //{
            //    for (int j = 1; j <= DoKolikoPutaSeMnozi; j++)
            //    {
            //        multiplicationTable[i - 1, j - 1] = i * j;
            //    }
            //}

            //return Ok(new { MultiplicationTable = multiplicationTable });
            int[][] multiplicationTable = new int[DoKojegBroja][];

            for (int i = 0; i < DoKojegBroja; i++)
            {
                multiplicationTable[i] = new int[DoKolikoPutaSeMnozi];
                for (int j = 0; j < DoKolikoPutaSeMnozi; j++)
                {
                    multiplicationTable[i][j] = (i + 1) * (j + 1);
                }
            }

            return Ok(multiplicationTable);
        }
                
        [HttpGet]
        [Route("CiklicnaMatrica")]           
        public ActionResult<string> GenerateCyclicMatrix(int rows, int columns)
        {
             int[,] matrix = CreateCyclicMatrix(rows, columns);

             StringBuilder sb = new StringBuilder();

             for (int i = 0; i < rows; i++)
             {
                 for (int j = 0; j < columns; j++)
                 {
                     sb.Append(matrix[i, j]);
                     if (j < columns - 1)
                         sb.Append(", ");
                 }
                 sb.AppendLine();
             }

             return Ok(sb.ToString());
        }

        private int[,] CreateCyclicMatrix(int rows, int columns)
        {
            int[,] matrix = new int[rows, columns];
            int value = 1;

            for (int layer = 0; layer < rows / 2; layer++)
            {
                for (int i = columns - layer - 1; i >= layer; i--)
                {
                    matrix[rows - layer - 1, i] = value++;
                }

                for (int i = rows - layer - 2; i >= layer; i--)
                {
                    matrix[i, layer] = value++;
                }

                for (int i = layer + 1; i < columns - layer - 1; i++)
                {
                    matrix[layer, i] = value++;
                }

                for (int i = layer; i < rows - layer - 1; i++)
                {
                    matrix[i, columns - layer - 1] = value++;
                }
            }

            // Stavio da ne bude problem sa neparnim vrijednostima redova i stupaca
            if (rows % 2 == 1 && columns % 2 == 1)
            {
                matrix[rows / 2, columns / 2] = value;
            }

            return matrix;
        }
        
    }
}
