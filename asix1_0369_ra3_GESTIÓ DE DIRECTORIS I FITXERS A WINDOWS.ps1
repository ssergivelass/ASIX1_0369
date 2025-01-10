#Llistar el contingut d’un directori:

#Get-ChildItem [-Path “ruta”]. Si volem accedir per llistar també el contingut dels subdirectoris afegirem l’opció -Recurse
Get-ChildItem -Path c:\sistemes -Recurse

#CMD dir [ruta], lista incloent subdirectoris /S
dir C:\sistemes /S

#Crear un nou directori

#PowerShell, podem crear altres tipos de objectes amb -ItemType 

New-Item -ItemType Directory -Path C:\sistemes\VM

#CMD , mkdir ruta  o md ruta, si anidem els directoris podem crealos al mateix temps.
mkdir C:\sistemes\VM\Windows
md C:\sistemes\VM\Linux\Ubuntu

#Copiar un directori

# Copy-Item [ruta]nom [ruta]nom2
#(podem copiar amb el mateix nom si no es dins del mateix directori).
#Només es copiarà la carpeta i no el seu contingut (o podem fer amb l’opció -Recurse)
Copy-Item C:\sistemes\ra1\act1 C:\sistemes\VM

#CMD -  xcopy [ruta]nom [ruta]nom2 
#per copiar el contingut cal fe servir la recursivitat /S
#Si volem els subdirectoris buits --> /E
#Aquesta comanda no funciona molt bé com a alias al PowerShell.


#Moure un directori

#PowerShell - Move-Item [ruta]origen ruta_destí (si la ruta destí no existeix la crea)
Move-Item C:\sistemes\VM C:\sistemes\VirtualBox

#CMD: utilitzarem la comanda move ruta_origen ruta_destí (que també existeix com a alias de Move-Item al PowerShell). 
#Atenció: posar una ruta de destí que no existeix no la crearà, però pot canviar el nom de la carpeta copiada.
move C:\sistemes\VirtualBox C:\sistemes\VM

#Renombrar un directori

#PowerShell: utilitzarem la comanda Rename-Item [ruta]nom nom2. Te un alias anomenat rni.
Rename-Item C:\sistemes\VM C:\sistemes\VirtualBox

#CMD: utilitzarem la comanda rename [ruta]nom nom2 o ren[ruta]nom nom2 
#(Aquest alies no funciona a PowerShell).
rename C:\sistemes\VirtualBox VM

#Eliminar directoris:

#PowerShell: utilitzarem la comanda Remove-Item [ruta]nom . 
#Si el directori està buit no hi haurà problemes, 
#si te contingut podem especificar l’opció -Recurse per eliminar tot el seu contingut 
#i el del seus subdirectoris (si no especifiquem la opció i no està buit demanarà confirmació
# per executar un esborrat recursiu). Te dos alias anomenats ri i rm.

Remove-Item C:\sistemes\VirtualBox\act1 -Recurse

#CMD: utilitzarem la comanda rmdir [ruta]nom o rd[ruta]nom
#si te contingut hem d’especificar l’opció /S

#GESTIÓ DE FITXERS:

#- Mostrar el contingut d’un fitxer:

#PowerShell: utilitzarem la comanda Get-Content [ruta]nom. 
#Té un alias anomenat gc. També podem executar la comanda notepad [ruta]nom, 
#i obrir el fitxer directament sobre el bloc de notes.

Get-Content C:\sistemes\nota.txt

#CMD: utilitzaríem la comanda type [ruta]nom
type C:\sistemes\nota.txt

#Crear un fitxer:

#PowerShell: utilitzarem, com en el cas dels directoris, la comanda New-Item però utilitzant -ItemType file
#Podem aprofitar el moment de crear el fitxer per posar algun contingut amb l’opció: -Value “text”

New-Item -ItemType File -Name professors.txt -Value "Alejandro i Sergio" -Path C:\sistemes
Get-Content C:\sistemes\professors.txt

#CMD: utilitzarem la comanda copy con [ruta]nom. Deixarà la terminal blocada per anar introduint línies de text. 
copy con c:\sistemes\curs
type c:\sistemes\curs

#Afegir contingut a un fitxer:

#PowerShell: utilitzarem la comanda Set-Content [ruta]nom “text” 
#(establirà el valor de text com el nou valor del fitxer sobreescrivint el contingut anterior)
#disposa del alias sc 
Set-Content C:\sistemes\nota.txt "Aquestes son les instruccion de l'assignatura"
#També podem utilitzar la comanda Add-Content [ruta]nom “text” (que no sobreescriu sinó que agrega contingut al final del fitxer)ç
#alias ac
Add-Content C:\sistemes\nota.txt "Trobareu les dates a les activitats principals i examens"

#CMD: tornarem a utilitzar la comanda copy con amb un fitxer existent (haurem de sobreescriure el nou valor)
#podem redirigir la sortida estàndard d’una comanda: 
#comanda > [ruta]nom (sobreescriu) o comanda >> [ruta]nom (afegeix contingut al final del fitxer). 
#Aquest mètode (> o >>) és funcional també al PowerShell (equivalent al Out-File).

#- Esborrar el contingut d’un fitxer:

Clear-Content C:\sistemes\nota.txt



