<?php 

require('baglanti.php');

if($_POST) {
    if(isset($_POST['email'])){
        //header('Location: kendisayfam.php');
        
        $eposta=strip_tags(trim($_POST['email']));
        $acarsoz=strip_tags(trim($_POST['acarsoz']));
        $adsor=mysqli_query($baglan," SELECT ad FROM kullanicilar WHERE eposta='".$eposta."' AND acarsoz='".$acarsoz."'");
        
        if(mysqli_num_rows($adsor)>0){
            $ad=mysqli_fetch_assoc($adsor)
               // printf ("%s (%s)\n",$ad["ad"]);
                echo $ad["ad"];
                // Free result set
                //mysqli_free_result($ad);
                
            
        }
        
        }
    }

        
        
       // $sorgula=mysqli_query($baglan," SELECT * FROM kullanicilar WHERE eposta='".$eposta."' AND acarsoz='".$acarsoz."'");
        
         //   if(mysqli_num_rows($sorgula)>0){
                
           //     header('Location: kendisayfam.php');
                
            //}
        
else{
    echo "veriler Gelmedi";
}
?>
