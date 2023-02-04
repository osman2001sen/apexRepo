global class futureMethodInternship {
    @future
    public static void fmInternship(){
        List<Lead>lds= new List<Lead>();
        for ( Integer i=0; i<100; i++){
            Lead ld= new Lead (LastName= 'test'+i, Company='test Company'+i);
            lds.add(ld);
        }
        Insert lds;
    }
}



/*
Anonymous Window

futureMethodInternship.fmInternship();
*/