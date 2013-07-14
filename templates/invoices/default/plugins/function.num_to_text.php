<?php
  function num_to_text($cislo,$nula=true) {
    $jednotky = array("","jedna","dva","tri","štyri","päť","šesť","sedem","osem","deväť");
    $mezi = array(11=>"jedenásť",12=>"dvanásť",13=>"trinásť",14=>"štvrnásť",15=>"päťnásť",16=>"šesťnásť",17=>"sedemnásť",18=>"osemnásť",19=>"deväťnásť");
    $desitky = array("","desať","dvacať","tricať","štyricať","pädesiat","šedesiat","sedemdesiat","osmdesiat","devädesiat");
    $delka = strlen($cislo);
    
    if($cislo==0 && $delka==1 && $nula===true) { return "nula"; }
    elseif($cislo==0 && $delka==1 && $nula===false) { return "0"; }
    
    $cislo = (string)ltrim(round($cislo),0);
    
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

  function smarty_function_num_to_text($params,$smarty) {
    $euros = intval($params['number']);
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
  
?>