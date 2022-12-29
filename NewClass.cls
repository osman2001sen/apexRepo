public class Kontrol {
	
    public static String TCKontrol(Integer sayi){
        Integer sonuc=math.mod(sayi,2);
        if(sonuc==0){
            return 'çift';
        }else{
            return 'tek';
        }
    }
}      