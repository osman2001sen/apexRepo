Map<String,String> capitalCountry = New Map <String,String>();
capitalCountry.put('Turkey','Ankara');  
capitalCountry.put('USA','Washington');
capitalCountry.put('Germany','Berlin');
capitalCountry.put('Canada','Ottowa');
System.debug(capitalCountry);
System.debug(capitalCountry.keySet()); 
System.debug(capitalCountry.values()); 
System.debug('Map size: '+capitalCountry.size());
capitalCountry.remove('Turkey'); 
System.debug(capitalCountry);
Map<String,String> centralCountry = capitalCountry.clone();
System.debug('Cloned: '+centralCountry);
System.debug('Capital of Germany : '+centralCountry.get('Germany'));
centralCountry.clear();
System.debug(centralCountry);