import java.util.Arrays;

public class DuoDec
{
   public static char[] digit 
            = {'@', '!', '?', '&', '%', '$', '=', '^', '(', ')', '[', ']'};

 
   public static int parseDuoDec(String s)
   {
      /* ------------------------------------------------------------------
         This loop checks if the input contains an illegal (non-DuoDec) digit
         ------------------------------------------------------------------ */
      for (int i = 0 ; i < s.length(); i++)
      {
         int j = 0;
         while ( j < digit.length )
         {
            if ( s.charAt(i) == digit[j] || s.charAt(i) == '-' )
            {
               break;
            }

            j++;
         }

         if ( j >= digit.length )
         {
            System.out.println("Illegal nano digit found in input: "
                                        + s.charAt(i) );
            System.out.println("A DuoDec digit must be one of these: "
                                + Arrays.toString (digit) );
            System.exit(1);
         }
      }

      // Write the parseDuoDec() code here
	int value, sign, pos;
	
	if (s.charAt(0) == '-') {
	    sign = -1;
	    pos = 1;
	  }
	else {
	    sign = 1;
	    pos = 0;
	}
	
	value = 0;
	for (int k = pos; k < s.length(); k++) {
      for (int j = 0; j < 12; j++) {

         if (s.charAt(k) == digit[j]) //looped to correct symbol
		     value = 12 * value + j; //2 digit or more
      }
	}
	
	if (sign == -1)
		value = -value;


	return(value);
}

	





   public static String toString(int value)
   {
      boolean inputwasNeg;
      int remainder[] = new int[100];
      char dig[] = new char[100];
      String result;
      int nDigits;

      if (value < 0) {
         inputwasNeg = true;
         value = -value;
      }
      else {
         inputwasNeg = false;
      }

      if (value == 0) { //special case 
         result = "@";
      }

      else {
         nDigits = 0;
         while (value > 0) {
            remainder[nDigits] = value % 12;
            nDigits++;

            value = value/12;

         }

         for (int i = 0; i < nDigits; i++) {
            dig[i] =  digit[remainder[i]]; //take the index of the symbol
         }

         result = "";

         for (int i = nDigits - 1; i >= 0; i--)
            result = result + dig[i];

         if (inputwasNeg) {
            result = "-" + result;
         }

         else {
            result = result;
         } 
      }

      return(result);

   }
}




