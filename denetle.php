<?php 

require('baglanti.php');

if($_POST) {
    if(isset($_POST['email'])){
        
        
        $eposta=strip_tags(trim($_POST['email']));
        $acarsoz=strip_tags(trim($_POST['acarsoz']));
        $adsor=mysqli_query($baglan," SELECT ad FROM kullanicilar WHERE eposta='".$eposta."' AND acarsoz='".$acarsoz."'");
             while ($row = mysqli_fetch_assoc($adsor)) {
                $ad=  $row['ad'];
                 session_start();
                 $_SESSION['ad']=$ad;
                 if(mysqli_num_rows($adsor)>0){
                
                header('Location: kendisayfam.php');
                
            }else{
            echo "yanlış giriş";
            }
        
                
            }
    }
}
else{
    echo "veriler Gelmedi";
}
?>
