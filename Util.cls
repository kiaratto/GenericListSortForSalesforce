//==============================================
// Criado por: Rodrigo Chiarato 
// Data: 23/03/2020
// Propósito: Classe gerérica que contém métodos para auxiliar no dia dia do desenvolvimento
// Descrição: Essa classe contém funções que podem ser usadas em todo o sistema sem segmento específico
//==============================================
public class Util {
   //==============================================
   // Criado por: Rodrigo Chiarato Domingues
   // Data: 27/03/2020 00:47
   // Propósito: Ordena Qualquer Lista de sObjects pelo campo informado
   // Descrição: Exibe os nulos por primeiro
   //==============================================
   public static List<sObject> OrdenarPor(List<sObject> lstsObject , String NomeDoCampo)
   {
      List<sObject> lstsObjectsOrdenada = new List<sObject>();
      List<String> ListaOrdenada = new List<String>();
      Integer Indice = 0; //caso tenha repetidos
      String ChaveCompleta;
      String ChaveInicial;
      map<String,sObject> mapString_sObject = new map<String,sObject>();
      for(sObject objsObject : lstsObject)
      {
         Indice = 0;
         if(objsObject.get(NomeDocampo) == null)
         {
            ChaveInicial = ' '; //precisa melhorar a questão do null
         }
         else
         {
            ChaveInicial = String.valueOf(objsObject.get(NomeDocampo));
         }

         ChaveCompleta = ChaveInicial + '_' + Indice;
         //se a chave existira acrescenta + 1
         while(mapString_sObject.containsKey(ChaveCompleta))
         {
            Indice++;
            ChaveCompleta = ChaveInicial + '_' + Indice;
         }
         mapString_sObject.put(ChaveCompleta, objsObject);
         ListaOrdenada.add(ChaveCompleta);

         System.debug(ChaveCompleta);
      }

      ListaOrdenada.sort();

      for(String mapKey : ListaOrdenada)
      {
         lstsObjectsOrdenada.add(mapString_sObject.get(mapKey));
      }

      return lstsObjectsOrdenada;
   }
}
