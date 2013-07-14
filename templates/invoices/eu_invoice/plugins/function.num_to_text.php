<?php
  function num_to_text($cislo,$nula=true) {
    $jednotky = array("","jedna","dva","tri","štyri","päť","šesť","sedem","osem","deväť");
    $mezi = array(11=>"jedenásť",12=>"dvanásť",13=>"trinásť",14=>"štvrnásť",15=>"päťnásť",16=>"šesťnásť",17=>"sedemnásť",18=>"osemnásť",19=>"deväťnásť");
    $desitky = array("","desať","dvacať","tricať","štyricať","pädesiat","šedesiat","sedemdesiat","osmdesiat","devädesiat");
                                              
    $cislo = (string)ltrim(round($cislo),0);  
    $delka = strlen($cislo);
    
    if($cislo==0 && $delka==1 && $nula===true) { return "nula"; }
    elseif($cislo==0 && $delka==1 && $nula===false) { return ""; }
    
    if($delka==1)        return $jednotky[$cislo];  //1 R
    elseif($delka==2) {                                 //2 R
      $desitkyAJednotky = $cislo{0}.$cislo{1};
      if($desitkyAJednotky==10) return "desať";
      elseif($desitkyAJednotky<20) {
        return $mezi[$desitkyAJednotky];
      }
      else {
        return $desitky[$cislo{0}].$jednotky[$cislo{1}];
      }
    }                 
    elseif($delka==3) {                                 //3 R
      if($cislo{0}==1)     return "sto".num_to_text(substr($cislo,1));
      elseif($cislo{0}==2) return "dvesto".num_to_text(substr($cislo,1));
      elseif($cislo{0}==3 OR $cislo{0}==4) return $jednotky[$cislo{0}]."sto".num_to_text(substr($cislo,1));
      elseif($cislo{0}>4) return $jednotky[$cislo{0}]."sto".num_to_text(substr($cislo,1));
      elseif($cislo{0}==0) return $jednotky[$cislo{0}].num_to_text(substr($cislo,1));
      else                 return $jednotky[$cislo{0}]."sto".num_to_text(substr($cislo,1)); 
    }                 
    elseif($delka==4) {                                //4 R
      if($cislo{0}==1) return "tisíc".num_to_text(substr($cislo,1));
      elseif($cislo{0}<5) return $jednotky[$cislo{0}]."tisíc".num_to_text(substr($cislo,1));
      else             return $jednotky[$cislo{0}]."tisíc".num_to_text(substr($cislo,1));
    }                 
    elseif($delka==5) {                                //5 R
      $desitkyTisic = $cislo{0}.$cislo{1};
      if($desitkyTisic==10)      return "desaťtisíc".num_to_text(substr($cislo,2));
      elseif($desitkyTisic<20)   return $mezi[$desitkyTisic]."tisíc".num_to_text(substr($cislo,2));
      elseif($desitkyTisic<100)  return $desitky[$cislo{0}].$jednotky[$cislo{1}]."tisíc".num_to_text(substr($cislo,2));
    }                 
    elseif($delka==6) {                                //6 R
      if($cislo{0}==1)  {
        if($cislo{1}.$cislo{2}==00)         return "stotisíc".num_to_text(substr($cislo,3));
        else                                return "sto".num_to_text(substr($cislo,1));
      }
      elseif($cislo{0}==2)                  return "dvesto".num_to_text(substr($cislo,1));
      elseif($cislo{0}==3 OR $cislo{0}==4)  return $jednotky[$cislo{0}]."sto".num_to_text(substr($cislo,1));
      else                                  return $jednotky[$cislo{0}]."sto".num_to_text(substr($cislo,1));
    } 
    return $cislo;
  }

  function en_num_to_text($number) {
      
      $hyphen      = '-';
      $conjunction = ' and ';
      $separator   = ', ';
      $negative    = 'negative ';
      $decimal     = ' point ';
      $dictionary  = array(
          0                   => 'zero',
          1                   => 'one',
          2                   => 'two',
          3                   => 'three',
          4                   => 'four',
          5                   => 'five',
          6                   => 'six',
          7                   => 'seven',
          8                   => 'eight',
          9                   => 'nine',
          10                  => 'ten',
          11                  => 'eleven',
          12                  => 'twelve',
          13                  => 'thirteen',
          14                  => 'fourteen',
          15                  => 'fifteen',
          16                  => 'sixteen',
          17                  => 'seventeen',
          18                  => 'eighteen',
          19                  => 'nineteen',
          20                  => 'twenty',
          30                  => 'thirty',
          40                  => 'fourty',
          50                  => 'fifty',
          60                  => 'sixty',
          70                  => 'seventy',
          80                  => 'eighty',
          90                  => 'ninety',
          100                 => 'hundred',
          1000                => 'thousand',
          1000000             => 'million',
          1000000000          => 'billion',
          1000000000000       => 'trillion',
          1000000000000000    => 'quadrillion',
          1000000000000000000 => 'quintillion'
      );
      
      if (!is_numeric($number)) {
          return false;
      }
      
      if (($number >= 0 && (int) $number < 0) || (int) $number < 0 - PHP_INT_MAX) {
          // overflow
          return false;
      }
  
      $string = $fraction = null;
      
      if (strpos($number, '.') !== false) {
          list($number, $fraction) = explode('.', $number);
      }
      
      switch (true) {
          case $number < 21:
              $string = $dictionary[$number];
              break;
          case $number < 100:
              $tens   = ((int) ($number / 10)) * 10;
              $units  = $number % 10;
              $string = $dictionary[$tens];
              if ($units) {
                  $string .= $hyphen . $dictionary[$units];
              }
              break;
          case $number < 1000:
              $hundreds  = $number / 100;
              $remainder = $number % 100;
              $string = $dictionary[$hundreds] . ' ' . $dictionary[100];
              if ($remainder) {
                  $string .= $conjunction . en_num_to_text($remainder);
              }
              break;
          default:
              $baseUnit = pow(1000, floor(log($number, 1000)));
              $numBaseUnits = (int) ($number / $baseUnit);
              $remainder = $number % $baseUnit;
              $string = en_num_to_text($numBaseUnits) . ' ' . $dictionary[$baseUnit];
              if ($remainder) {
                  $string .= $remainder < 100 ? $conjunction : $separator;
                  $string .= en_num_to_text($remainder);
              }
              break;
      }
      
      if (null !== $fraction && is_numeric($fraction)) {
          $string .= $decimal;
          $words = array();
          foreach (str_split((string) $fraction) as $number) {
              $words[] = $dictionary[$number];
          }
          $string .= implode(' ', $words);
      }
      
      return $string;
  }


  function de_num_to_text($zahl)
  {
      $a = array(
              '',
              'ein',
              'zwei',
              'drei',
              'vier',
              'fünf',
              'sechs',
              'sieben',
              'acht',
              'neun',
              'zehn',
              'elf',
              'zwölf'
      );
      $b = array(
              '',
              'zehn',
              'zwanzig',
              'dreßig',
              'vierzig',
              'fünfzig',
              'sechzig',
              'siebzig',
              'achtzig',
              'neunzig'
      );
      
      $wort = "";
      
      // > 1000
      
      $tausend = false;
      
      if ($zahl >= 100000.00)
      {
          $wert = floor(($zahl - $zahl % 100000) / 100000);
          if ($wert > 9)
              return "Betrag zu hoch";
          $wort = $a[$wert] . 'hundert';
          $zahl -= $wert * 100000;
          $tausend = true;
      }
      if ($zahl >= 20000.00)
      {
          $wert = floor(($zahl - $zahl % 1000) / 1000);
          if ($wert % 10 != 0)
          {
              $wort .= $a[$wert % 10] . 'und' . $b[($wert - $wert % 10) / 10];
          }
          else
          {
              $wort .= $b[$wert / 10];
          }
          $zahl -= $wert * 1000.00;
          $tausend = true;
      }
      elseif ($zahl >= 13000.00)
      {
          $wert = floor(($zahl - $zahl % 1000) / 1000);
          $wort .= $a[$wert % 10] . 'zehn';
          $zahl -= $wert * 1000;
          $tausend = true;
      }
      elseif ($zahl >= 1000.00)
      {
          $wert = floor(($zahl - $zahl % 1000) / 1000);
          $wort .= $a[$wert];
          $zahl -= $wert * 1000;
          $tausend = true;
      }
      if ($tausend)
      {
          $wort .= 'tausend ';
      }
          
  
      // < 1000
      
      if ($zahl >= 100.00)
      {
          $wert = floor(($zahl - $zahl % 100) / 100);
          if ($wert > 9)
              return "Betrag zu hoch";
          $wort .= $a[$wert] . 'hundert';
          $zahl -= $wert * 100;
      }
      if ($zahl >= 20.00)
      {
          $wert = floor($zahl);
          if ($wert % 10 != 0)
          {
              $wort .= $a[$wert % 10] . 'und' . $b[($wert - $wert % 10) / 10];
          }
          else
          {
              $wort .= $b[$wert / 10];
          }
          $zahl -= $wert;
      }
      elseif ($zahl >= 13.00)
      {
          $wert = floor($zahl);
          $wort .= $a[$wert % 10] . 'zehn';
          $zahl -= $wert;
      }
      elseif ($zahl >= 1.00)
      {
          $wert = floor($zahl);
          if ($tausend)
              $wort .= 'und ';
          $wort .= $a[$wert];
          $zahl -= $wert;
      }
      
      if (!empty($wort))
          $wort .= '';
  
      // cent
      $zahl = round($zahl * 100);
      if ($zahl > 0)
      {
          $wort .= ' und ';
          if ($zahl >= 20)
          {
              $wert = floor($zahl);
              if ($wert % 10 != 0)
              {
                  $wort .= $a[$wert % 10] . 'und' . $b[($wert - $wert % 10) / 10];
              }
              else
              {
                  $wort .= $b[$wert / 10];
              }
              $zahl -= $wert;
          }
          elseif ($zahl >= 13)
          {
              $wert = floor($zahl);
              $wort .= $a[$wert % 10] . 'zehn';
              $zahl -= $wert;
          }
          elseif ($zahl >= 1)
          {
              $wert = floor($zahl);
              $wort .= $a[$wert];
              $zahl -= $wert;
          }
          $wort .= '';
      }
      
      return $wort;
  }


  function smarty_function_num_to_text($params,$smarty) {
    $euros = intval($params['number']);
    $locale = $params['lang'];
    
    if($locale=="SK" || $locale=="CZ") {
    
      if($euros!="" && $euros<0) {
        $euros_rel = -$euros;
        echo "mínus=".num_to_text($euros_rel,$params['zero']);
      } elseif($euros!="") {
        echo num_to_text($euros,$params['zero']);
      } elseif($euros=="" || $euros==0) {
        echo num_to_text(0,$params['zero']);
      } else {
        echo "";
      }
    
    }
    elseif($locale=="AT" || $locale=="DE" || $locale=="CH") {
    
      if($euros!="" && $euros<0) {
        $euros_rel = -$euros;
        echo "minus=".de_num_to_text($euros_rel);
      } elseif($euros!="") {
        echo de_num_to_text($euros);
      } elseif($euros=="" || $euros==0) {
        echo de_num_to_text(0);
      } else {
        echo "";
      }
    
    } else {
    
      if($euros!="" && $euros<0) {
        $euros_rel = -$euros;
        echo "minus=".num_to_text($euros_rel,$params['zero']);
      } elseif($euros!="") {
        echo en_num_to_text($euros);
      } elseif($euros=="" || $euros==0) {
        echo en_num_to_text(0);
      } else {
        echo "";
      }    
    
    }
  }  
  
?>