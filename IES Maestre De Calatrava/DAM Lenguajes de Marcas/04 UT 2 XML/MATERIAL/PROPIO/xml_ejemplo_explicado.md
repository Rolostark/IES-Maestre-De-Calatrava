### 1. Explicación: ¿De qué va la estructura básica de XML?

Piensa en XML (eXtensible Markup Language) como un sistema de cajas dentro de cajas para organizar información. No hace nada por sí solo, simplemente sirve para transportar y estructurar datos de manera que tanto humanos como máquinas puedan leerlos fácilmente.

Todo documento XML se construye con estos bloques:

- **El Prólogo**: Es la tarjeta de presentación del archivo. Va siempre en la primera línea y avisa al programa que lo lea de que está ante un archivo XML, qué versión usa y cómo está codificado el texto.
    
- **Elementos y Etiquetas**: Son las famosas "cajas". Cada dato va envuelto entre una etiqueta de inicio (`<caja>`) y una de cierre (`</caja>`). También hay etiquetas "vacías" que se abren y cierran a la vez (`<caja/>`).
    
- **Atributos**: Son características extra que le ponemos a la etiqueta de inicio para dar más información sobre ese elemento (ej: `<caja color="rojo">`).
    
- **Entidades predefinidas**: En XML hay caracteres prohibidos (como `<` o `>`) porque el programa pensaría que estás abriendo una etiqueta nueva. Para usarlos como texto normal, usamos códigos especiales llamados entidades.
    
- **Secciones CDATA**: Si necesitas meter un bloque de texto enorme que tiene un montón de caracteres raros (como código de programación) y no quieres estar cambiando cada carácter por una entidad, usas CDATA. Le dice al XML: _"Ignora todo lo que hay aquí dentro, es solo texto literal"_.
    
- **Comentarios**: Notas para ti o para otros programadores que el ordenador ignorará por completo.
    

---

### 2. Tu Chuleta Rápida (Cheat Sheet)

Guárdate esto para tener la sintaxis siempre a mano:

- **Prólogo obligatorio**: `<?xml version="1.0" encoding="UTF-8"?>`
    
- **Etiqueta normal**: `<nombre>Texto aquí</nombre>`
    
- **Etiqueta vacía**: `<imagen src="foto.jpg" />`
    
- **Atributo**: `<coche marca="Seat">` _(¡Siempre entre comillas dobles o simples!)_
    
- **Comentarios**: ``
    
- **Sección CDATA**: `<![CDATA[ Texto que el XML ignorará < > & ]]>`
    
- **Caracteres prohibidos (Entidades)**:
    
    - `<` se escribe `&lt;`
        
    - `>` se escribe `&gt;`
        
    - `&` se escribe `&amp;`
        
    - `"` se escribe `&quot;`
        
    - `'` se escribe `&apos;`
        

---

### 3. Ejemplo Práctico

Aquí tienes cómo se ve todo esto puesto en práctica en un solo archivo XML bien estructurado:

XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<biblioteca>
    
    <libro categoria="Ficción">
        <titulo>El Señor de los Anillos</titulo>
        <autor>J.R.R. Tolkien</autor>
        
        <editorial>George Allen &amp; Unwin</editorial>
        
        <disponible en_stock="si"/>
    </libro>

    <libro categoria="Programación">
        <titulo>Aprende HTML y XML</titulo>
        
        <ejemplo_codigo>
            <![CDATA[
                Para hacer un salto de línea en HTML usa <br> y no dará error.
            ]]>
        </ejemplo_codigo>
    </libro>

</biblioteca>
```

---

### 4. Recomendaciones de YouTube

Para terminar de asentar los conceptos, te recomiendo estos vídeos en español que van directos al grano sobre la estructura básica:

- **[¿QUÉ ES XML Y PARA QUÉ SE USA?](http://www.youtube.com/watch?v=AZihBEg8VBk)** (del canal _OpenWebinars_): Un vídeo muy corto (menos de 5 minutos) y al pie, perfecto para entender la filosofía detrás del XML de forma muy visual.
    
- **[¿Qué es XML? | Introducción al XML | XML Well Formed](http://www.youtube.com/watch?v=ApASENQopFU)** (del canal _Marc Venteo_): Un tutorial un poco más largo (unos 18 min) donde abre un editor de código (Visual Studio Code) y te enseña las características de la estructura paso a paso escribiendo código.
    
- **[TUTORIAL XML DESDE CERO EN ESPAÑOL](http://www.youtube.com/watch?v=SKOVdy5fGMM)** (del canal _Informatica con Abaga Motu_): Excelente si quieres empezar un curso práctico desde lo más básico (etiquetas, atributos) de forma calmada.


<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />

¡Marchando el Punto 2! Este punto es fundamental, porque en el mundo del XML no basta con escribir código que "parezca" correcto; hay dos niveles de exigencia muy claros: **Bien formado** y **Válido**.

Vamos a desgranarlo con la misma estructura para que te quede cristalino.

---

### 1. Explicación: La diferencia entre "Bien Formado" y "Válido"

Imagina que el XML es como escribir una carta formal.

- **Documento Bien Formado (Well-formed):** Significa que has escrito la carta respetando la gramática y ortografía básica del idioma. Un documento XML se dice que es bien formado si satisface un conjunto de reglas que permiten que una herramienta XML lo analice de forma correcta. Si te saltas una regla (por ejemplo, te olvidas de cerrar una etiqueta o no pones comillas), el programa que lee el XML se "rompe" y da un error fatal.
    
- **Documento Válido (Valid):** Es ir un paso más allá. No solo la ortografía es perfecta, sino que el contenido de la carta sigue una plantilla o formulario estricto que la empresa te ha dado. Un documento XML es válido si es bien formado y satisface las reglas que impone un DTD o un Schema. Estos archivos (DTD o Schema) son como los "planos" que dictan qué etiquetas están permitidas, en qué orden deben ir y qué tipo de datos pueden contener.
    

---

### 2. Tu Chuleta Rápida (Cheat Sheet)

Guárdate estas reglas de oro, porque son la principal causa de dolores de cabeza al hacer un XML:

**Para que sea BIEN FORMADO (Reglas obligatorias de sintaxis):**

- **Elemento Raíz Único:** Los documentos XML sólo permiten un elemento raíz, del que todos los demás sean parte.
    
- **Jerarquía estricta:** Los documentos XML deben seguir una estructura estrictamente jerárquica con lo que respecta a las etiquetas que delimitan sus elementos. Las etiquetas deben cerrarse en el orden inverso al que se abrieron (nada de `<gato><pelo></gato></pelo>`).
    
- **Sensible a mayúsculas/minúsculas:** El XML trata las mayúsculas y minúsculas como caracteres diferentes. Si un elemento está definido como `ELEMENTO`, no puedes usar `elemento` ni `Elemento`.
    
- **Atributos entre comillas:** Los valores de atributos en XML siempre deben estar encerradas en comillas simples (') o dobles (").
    
- **Etiquetas vacías cerradas:** XML permite elementos vacíos, pero la etiqueta debe cerrarse siempre (ej. `<elemento-sin-contenido/>` o `<elemento-sin-contenido></elemento-sin-contenido>`).
    

**Para que sea VÁLIDO:**

- **Condición previa:** XML válido implica que el documento XML está bien formado.
    
- **Obediencia al DTD/Schema:** Además, sigue las reglas de un DTD (Document Type Definition) o un Schema.
    

---

### 3. Ejemplo Práctico

Aquí tienes la evolución para que veas la diferencia visualmente:

**1. Documento Bien Formado (pero NO válido):** Este código cumple la sintaxis XML perfectamente, pero nadie le ha dicho qué estructura de datos debe seguir.

XML

```xml
<?xml version="1.0"?>
<mensaje>¡Hola, Mundo!</mensaje>
```

**2. Documento Válido (Bien formado + DTD):** Este código no solo está bien escrito, sino que incluye un DTD que obliga a que exista un elemento raíz llamado `mensaje` y que su contenido sea solo texto analizable (`#PCDATA`).

XML

```xml
<?xml version="1.0"?>
<!DOCTYPE mensaje [
<!ELEMENT mensaje (#PCDATA)>
]>
<mensaje>Hola, Mundo!</mensaje>
```

---

### 4. Recomendaciones de YouTube

Para ver cómo estas reglas se aplican en la vida real (y cómo los editores de código te avisan de los errores), te recomiendo estos vídeos en español:

- **[XML: Documento bien formado](https://www.youtube.com/watch?v=s1RgyhO9F2I)** (del profesor universitario _Sergio Luján Mora_): Es un clásico absoluto. Te explica con rigor académico pero de forma muy accesible todas las reglas para que el documento no te dé fallos.
    
- **[XML: Validación de un documento](https://www.youtube.com/watch?v=ZkOmQlC0QlE)** (también de _Sergio Luján Mora_): La continuación directa del anterior, donde se centra específicamente en explicar qué significa que un documento esté validado contra un DTD o Schema.
    
- **[CÓMO CREAR DOCUMENTOS XML VÁLIDOS (LENGUAJE DE MARCAS XML)](https://www.youtube.com/watch?v=k-wfUkqMm-w)** (del canal _Informática con Abaga Motu_): Muy práctico, va escribiendo el código desde cero y te muestra cómo aplicar la declaración de versión, codificación y la estructura jerárquica para no saltarse el estándar.

<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />

¡Allá vamos con el Punto 3! Este tema es el corazón de la validación en XML. Entender el **Document Type Definition (DTD)** es como pasar de escribir textos libres a crear formularios oficiales donde cada campo está estrictamente controlado.

Aquí tienes el desglose completo sobre el DTD, con su explicación, tu chuleta de código, ejemplos y, por supuesto, los vídeos para rematar.

---

### 1. Explicación: ¿Qué es exactamente el DTD y para qué sirve?

Piensa en un DTD como si fuera el **plano arquitectónico** o el **libro de reglas** de tu documento XML . Su función principal es decirle al ordenador exactamente qué estructura debe tener la información. Específicamente, especifica las relaciones que existen entre los elementos y la lista de los atributos que pueden llevar.

**¿Por qué es tan importante usar un DTD?**

- **Creación de vocabularios propios**: Permite que cualquier organización, empresa o grupo defina su propio lenguaje estándar adaptado a los documentos que usan habitualmente.
    
- **Control de calidad automatizado**: Permite componer documentos que son sintácticamente correctos de forma sencilla. Si alguien introduce un elemento que no estaba en el "plano", el analizador lanzará un error.
    
- **Integración con software**: Facilita la creación y el uso de editores inteligentes que asisten a los usuarios ocultando la complejidad del código.
    

Un DTD no solo define las etiquetas (`elementos`); en su interior también puede albergar declaraciones de atributos, entidades, notaciones, instrucciones de procesamiento y comentarios.

---

### 2. Tu Chuleta Rápida (Cheat Sheet)

Guárdate esta sintaxis para no perderte al enlazar o crear tus DTDs.

- **La declaración base**: Todo DTD siempre comienza por la cadena de texto `<!DOCTYPE` y debe indicar siempre cuál es el tipo del elemento raíz de todo el documento.
    
- **Tres formas de aplicarlo**:
    
    - **Interna**: Todo el plano se escribe dentro del propio archivo XML.
        
    - **Externa**: El plano está en un archivo `.dtd` separado y el XML lo llama a través de una ruta (ideal para que muchos XML compartan las mismas reglas).
        
    - **Mixta**: Combinando ambas formas.
        
- **Las palabras mágicas (Tipos de enlaces externos)**:
    
    - `SYSTEM`: Se usa cuando el archivo DTD está en tu propio sistema o servidor (es un recurso privado).
        
    - `PUBLIC`: Se usa para estándares que son públicos y conocidos por toda la comunidad de internet.
        

---

### 3. Ejemplo Práctico

Para que veas la diferencia, aquí tienes cómo se aplica un DTD internamente y cómo se enlaza de forma externa.

**Opción A: DTD Interno (Todo en el mismo archivo)** Aquí, las reglas de cómo debe ser la etiqueta `<mensaje>` van incrustadas justo antes del contenido real.

XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mensaje [
  <!ELEMENT mensaje (#PCDATA)>
]>
<mensaje>¡Esto es un mensaje validado internamente!</mensaje>
```

**Opción B: DTD Externo (Separado en dos archivos)** Esta es la forma profesional de hacerlo. Así puedes tener mil mensajes distintos que siguen el mismo patrón de un solo archivo DTD.

_Archivo: `reglas_mensaje.dtd`_

Fragmento de código

```dtd
<!ELEMENT mensaje (#PCDATA)>
```

_Archivo: `documento.xml`_

XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mensaje SYSTEM "reglas_mensaje.dtd">

<mensaje>¡Esto es un mensaje que llama a su DTD de fuera!</mensaje>
```

_(Nota: fíjate que en la llamada al archivo externo hemos usado la palabra `SYSTEM` seguida de la ruta)._

---

### 4. Recomendaciones de YouTube

Ponerse a programar un DTD por primera vez puede impresionar un poco, así que aquí tienes un par de vídeos excelentes para ver cómo se hace paso a paso:

- **[XML: Mi primer DTD](https://www.youtube.com/watch?v=EfnWCeQNTQI)** (del profesor universitario _Sergio Luján Mora_): Como te recomendé en el punto anterior, este profesor es un referente. En este vídeo abre un editor, crea un documento XML desde cero y luego te muestra exactamente cómo escribir su DTD correspondiente con declaraciones de elementos y atributos.
    
- **[Definición de documento XML con DTD](https://www.youtube.com/watch?v=Cl78d5h5CRs)** (de _Píldoras Informáticas / tutoriales genéricos_): Un vídeo muy práctico y visual donde te muestran claramente en pantalla la diferencia práctica entre declarar el DTD de manera interna con los corchetes o llevarlo a un archivo de texto independiente.

<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />


¡Por supuesto! Llegamos al **Punto 4: Declaraciones de Elementos y Atributos**. Aquí es donde la magia de la validación realmente ocurre, ya que le decimos al XML no solo qué cajas existen, sino qué pueden llevar dentro y cuántas veces pueden repetirse.

Vamos a estructurarlo igual que los puntos anteriores.

---

### 1. Explicación: Las reglas del contenido y sus propiedades

Cuando creas un DTD, tienes que definir dos cosas principales sobre la información de tu XML:

**A. Los Elementos (Las "cajas")** Una declaración de elementos contiene el tipo de un elemento y su modelo de contenido. Básicamente, dictas qué va dentro de una etiqueta:

- **Texto puro**: Si solo lleva letras o números, se usa `#PCDATA` ("Parser Character Data"), que es un dato que debe ser objeto de análisis.
    
- **Otros elementos (Secuencias u Opciones)**: Puedes decir que una etiqueta contiene a otra u otras. Si los separas por comas (ej. `(profesor, aula)`), determinan el orden estricto en el que deben aparecer. Si usas la barra vertical `|` (ej. `(helado | pastel)`), significa un "o exclusivo", es decir, que puedes elegir una u otra opción, pero no ambas.
    
- **Elementos especiales**: `EMPTY` (el elemento no tiene contenido y se llama elemento vacío) o `ANY` (puede tener cualquier contenido, aunque no se recomienda usarlo para mantener el orden).
    
- **Símbolos de frecuencia**: Controlan cuántas veces aparece un elemento:
    
    - **Ninguno**: Aparece solo 1 vez obligatoriamente.
        
    - **`+`**: Aparece 1 o más veces.
        
    - **`*`**: Es opcional y puede aparecer 0, 1 o infinitas veces.
        
    - **`?`**: Es opcional, pero aparece como máximo 1 vez.
        

**B. Los Atributos (Las "propiedades" de las cajas)** Las declaraciones de lista de atributos (`ATTLIST`) añaden información sencilla y desestructurada a los elementos. Tienes que definir tres cosas por atributo:

1. **Su tipo**:
    
    - `CDATA`: Datos de caracteres normales.
        
    - `ID` e `IDREF`: `ID` es un identificador único que no se puede repetir en todo el documento (como el DNI), e `IDREF` es un puntero hacia ese `ID` (para crear hipervínculos o relaciones, como en una base de datos).
        
    - **Enumeraciones**: Limita las opciones posibles (ej. `(oficina | movil | particular)`).
        
2. **Su comportamiento (Palabras clave)**:
    
    - `#REQUIRED`: Es obligatorio poner el atributo.
        
    - `#IMPLIED`: Es opcional poner el atributo.
        
    - `#FIXED`: Su valor es constante y no puede cambiar en todo el documento.
        
    - **Valor por defecto**: Un valor entre comillas que se aplica si el usuario no pone el atributo.
        

---

### 2. Tu Chuleta Rápida (Cheat Sheet)

Guárdate esta chuleta para tener la sintaxis exacta de los elementos, atributos y sus modificadores:

**Declaración de Elementos:**

- `<!ELEMENT nombre (#PCDATA)>` (Solo texto analizable)
    
- `<!ELEMENT receta (ingredientes, preparacion)>` (Secuencia obligatoria en ese orden)
    
- `<!ELEMENT receta (ingredientes | preparacion)>` (Opción: una u otra)
    
- `<!ELEMENT salto EMPTY>` (Elemento vacío, sin contenido)
    

**Símbolos de Frecuencia:**

- `elemento+` -> Al menos 1 vez (1 a infinito).
    
- `elemento*` -> Opcional múltiple (0 a infinito).
    
- `elemento?` -> Opcional único (0 o 1).
    

**Declaración de Atributos (`<!ATTLIST ...>`):** Sintaxis general: `<!ATTLIST elemento nombre_atributo TIPO_DATO COMPORTAMIENTO>`

- `<!ATTLIST persona edad CDATA #IMPLIED>` (Opcional, texto normal)
    
- `<!ATTLIST persona dni ID #REQUIRED>` (Obligatorio, único e irrepetible)
    
- `<!ATTLIST envio urgencia (normal | urgente) "normal">` (Enumeración con valor por defecto "normal")
    
- `<!ATTLIST coche ruedas CDATA #FIXED "4">` (Valor inmutable)
    

---

### 3. Ejemplo Práctico

Vamos a ver un ejemplo supercompleto donde se aplica todo: DTD con elementos, atributos, secuencias, frecuencias y IDs.

XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE concesionario [
  <!ELEMENT concesionario (coche+)>
  
  <!ELEMENT coche (modelo, extra*, descuento?)>
  
  <!ATTLIST coche
      matricula ID #REQUIRED
      categoria (utilitario | suv | deportivo) "utilitario"
  >

  <!ELEMENT modelo (#PCDATA)>
  
  <!ELEMENT extra EMPTY>
  <!ATTLIST extra
      nombre CDATA #REQUIRED
      precio CDATA #IMPLIED
  >

  <!ELEMENT descuento (#PCDATA)>
]>

<concesionario>
  <coche matricula="M-1234">
    <modelo>Seat Ibiza</modelo>
    <extra nombre="Pintura Metalizada" precio="300" />
    <extra nombre="Llantas de aleación" /> </coche>

  <coche matricula="B-9876" categoria="suv">
    <modelo>Peugeot 3008</modelo>
    <descuento>15%</descuento>
  </coche>
</concesionario>
```

---

### 4. Recomendaciones de YouTube

Si quieres dominar las declaraciones y ver cómo los errores saltan en pantalla al validar, te recomiendo estos recursos:

- **[XML Tutorial | DTD Attributes Tutorial](https://www.youtube.com/watch?v=e3e0IrkpGsA)** (del canal _Informatica con Abaga Motu_): Un vídeo enfocado puramente en crear documentos válidos, repasando los tipos de atributos y el uso de validadores online.
    
- **[Validación de atributos mediante DTD](https://www.youtube.com/watch?v=vMNwBteCWKI)** (del profesor universitario _Sergio Luján Mora_): Te explica detalladamente la diferencia entre `#REQUIRED`, `#IMPLIED`, `#FIXED` y la validación de `ID` e `IDREF` (minuto a minuto muy bien detallado).
    
- **[6. DTD. Definición de atributos](https://www.youtube.com/watch?v=cC6dX2hgEq8)**: Un extracto muy directo y práctico sobre la sintaxis concreta de los atributos, qué va dentro de `ATTLIST` y los tipos de datos como CDATA.

<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />

¡Vamos a por el **Punto 5: Entidades**! Si el DTD era el plano de tu edificio, las entidades son como las **variables de programación** o los **atajos de teclado** que te ahorran escribir lo mismo una y otra vez.

Aquí tienes todo desglosado para que te quede claro cómo declarar atajos y cómo vincular archivos externos.

---

### 1. Explicación: ¿Qué son y qué tipos de Entidades existen?

En general, la palabra entidad se refiere a un objeto usado para guardar información. Una entidad actúa como una colección de datos con un nombre que sirve como referencia que "apunta" a ella. Además, el concepto de entidad permite descomponer un documento gigante en distintas unidades físicas contenidas en una o más unidades de almacenamiento.

Hay tres grandes familias que debes conocer:

- **Entidades generales internas**: Son simples abreviaturas definidas en la sección del DTD del documento. Una vez que el procesador XML ve la referencia, la reemplaza por su contenido y la analiza como si siempre hubiera estado ahí.
    
- **Entidades externas (Analizadas y No Analizadas)**: A diferencia de las anteriores, su contenido no está dentro del propio DTD, sino en cualquier otro sitio del sistema o internet.
    
    - Para usarlas, se hace referencia a su contenido mediante una URI precedida de la palabra clave `SYSTEM` o `PUBLIC`.
        
    - Si el archivo externo es simplemente más texto XML, se considera "analizada". Pero si el contenido de una entidad es un archivo MPEG, una imagen GIF o un ejecutable, el procesador XML no debe intentar interpretarlo como si fuera texto XML; a esto se le llama entidad externa "no analizada".
        
- **Entidades paramétricas**: Son un tipo especial que solo pueden usarse dentro del propio DTD, no del documento XML. Sirven para poder escribir bloques enteros de reglas de forma abreviada y se distinguen por el uso de un nombre encabezado por el símbolo `%`. Al igual que las generales, pueden ser tanto internas como externas.
    

---

### 2. Tu Chuleta Rápida (Cheat Sheet)

Ten esta lista a mano para recordar cómo declarar y "llamar" a cada tipo de entidad:

**Declaración en el DTD:**

- **General Interna**: `<!ENTITY nombre "valor">`.
    
- **General Externa Analizada**: `<!ENTITY intro SYSTEM "http://www.miservidor.com/intro.xml">`.
    
- **Externa No Analizada (Multimedia)**: `<!ENTITY logo SYSTEM "logo.gif">`.
    
- **Paramétrica Interna**: `<!ENTITY % nombre "valor">`.
    
- **Paramétrica Externa**: `<!ENTITY % elemento SYSTEM "mielemento.ent">`.
    

**Cómo "Llamar" o Invocar a las Entidades:**

- En el código XML normal (generales): Usa el ampersand y punto y coma `&nombre;`
    
- En el código DTD (paramétricas): Usa el porcentaje y punto y coma `%nombre;`
    

---

### 3. Ejemplo Práctico

Imagina que tienes una empresa y estás harto de escribir el aviso legal larguísimo en cada documento XML. Y además, en tu DTD usas mucho los atributos "ancho y alto". Vamos a usar entidades para simplificar:

XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE web [
  <!ENTITY empresa "Acme Corporation Inc.">
  
  <!ENTITY aviso_legal SYSTEM "textos/aviso.xml">

  <!ENTITY % dimensiones "alto CDATA #REQUIRED ancho CDATA #REQUIRED">

  <!ELEMENT web (titulo, contenido, footer)>
  <!ELEMENT titulo (#PCDATA)>
  <!ELEMENT contenido EMPTY>
  <!ELEMENT footer (#PCDATA)>

  <!ATTLIST contenido %dimensiones;>
]>

<web>
  <titulo>Bienvenidos a &empresa;</titulo>
  
  <contenido alto="500" ancho="800" />
  
  <footer>&aviso_legal;</footer>
</web>
```

---

### 4. Recomendaciones de YouTube

Para ver esto en acción y entender cómo el procesador XML interpreta estos atajos, te sugiero estos vídeos:

- **[Document Type Definition (DTD) (parte 3)](https://www.youtube.com/watch?v=IeieG-hgBKo)** (del profesor universitario _Sergio Luján Mora_): En esta parte de su curso sobre DTD, dedica el vídeo completo a explicar las entidades de manera teórica pero con ejemplos visuales claros. Hace especial énfasis en las entidades paramétricas y cómo se usan en DTDs reales complejos (como el estándar XHTML).
    
- **[XML Entidades - Tutorial Básico]**: Si buscas algo más genérico en español, la mayoría de cursos que cubren DTD (como los de _Informática con Abaga Motu_) suelen dedicar una lección a la sintaxis del `<!ENTITY>` y cómo no confundir las entidades generales predefinidas (`&lt;`, `&amp;`) con las que tú mismo puedes crear.


<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />

¡Allá vamos con el **Punto 6: Anotaciones y Secciones Condicionales**! Este es el nivel "pro" del DTD. Si alguna vez te has preguntado cómo hace un XML para saber qué programa debe abrir una imagen, o cómo los programadores tienen "versiones de prueba" y "versiones finales" en el mismo archivo, aquí está la respuesta.

---

### 1. Explicación: Dar contexto y controlar qué se lee

En este punto manejamos dos herramientas avanzadas para organizar y dar superpoderes a tu DTD:

**A. Anotaciones (`NOTATION`)** La palabra inglesa _notation_ tiene entre sus significados el de "notas" o "anotación", dando la idea de proporcionar información adicional. Esto es vital en un DTD para detallar a las aplicaciones externas cómo interpretar los datos de un atributo o de una entidad (por ejemplo, indicar un tipo MIME como `image/jpeg`). Las anotaciones se pueden usar de dos formas:

- **En atributos**: Permiten especificar que el valor de un atributo se ajusta a un formato o anotación específica (como elegir entre formato europeo o ISO para una fecha, o un tipo de imagen).
    
- **En entidades (Datos multimedia)**: Se usan con la palabra clave `NDATA` para avisar al procesador de que una entidad externa no es texto XML, sino un recurso binario (como un GIF o un JPG) que debe procesarse con el programa asociado a esa anotación.
    

**B. Secciones Condicionales (`INCLUDE` e `IGNORE`)**

Las DTDs tienen la posibilidad de incluir o ignorar declaraciones enteras usando bloques especiales.

- La palabra clave `INCLUDE` sirve para especificar las declaraciones que el procesador XML sí va a leer y aplicar.
    
- La palabra clave `IGNORE` le dice al procesador que excluya u omita todo lo que hay dentro de ese bloque. Lo más potente es combinar esto con "Entidades Paramétricas" (las del `%`) para crear una especie de "interruptor" global. Cambiando una sola palabra en el archivo de "IGNORE" a "INCLUDE", activas o desactivas cientos de reglas de golpe.
    

---

### 2. Tu Chuleta Rápida (Cheat Sheet)

Aquí tienes la sintaxis exacta para no liarte con los corchetes (que en las condicionales hay unos cuantos):

**Declarar una Anotación (`NOTATION`):**

- `<!NOTATION gif SYSTEM "image/gif">`
    
- `<!NOTATION jpeg SYSTEM "image/jpeg">`
    

**Usar la Anotación en un Atributo:**

- `<!ATTLIST mountain photo_type NOTATION (GIF | JPG | PNG) #IMPLIED>`
    

**Usar la Anotación en una Entidad Externa (Multimedia):**

- `<!ENTITY logogif SYSTEM "logo.gif" NDATA gif>`
    

**Secciones Condicionales Básicas:**

- Para incluir: `<![INCLUDE [ <!ELEMENT nombre (#PCDATA)> ]]>`
    
- Para ignorar: `<![ IGNORE [ <!ELEMENT mensaje (#PCDATA)> ]]>`
    

**El "Interruptor" con Entidades Paramétricas:**

- `<!ENTITY % aceptar "INCLUDE">`
    
- `<![%aceptar; [ ]]>`
    

---

### 3. Ejemplo Práctico

Imagina que estamos diseñando el DTD para una aplicación de mensajería. Queremos avisar de que las fotos de perfil son imágenes JPG, y además queremos tener una versión "BETA" en desarrollo que requiera un motivo de rechazo de mensaje, y otra versión final que no.

XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE sistema [
  
  <!NOTATION jpg SYSTEM "image/jpeg">
  <!ENTITY foto_usuario SYSTEM "archivos/perfil_01.jpg" NDATA jpg>

  <!ELEMENT sistema (usuario, mensaje)>
  <!ELEMENT usuario EMPTY>
  
  <!ATTLIST usuario 
      nombre CDATA #REQUIRED
      avatar ENTITY #IMPLIED>

  <!ENTITY % version_final "INCLUDE">
  <!ENTITY % version_beta "IGNORE">

  <![%version_final; [
    <!ELEMENT mensaje (texto, firma)>
  ]]>

  <![%version_beta; [
    <!ELEMENT mensaje (texto, razon_rechazo, firma)>
    <!ELEMENT razon_rechazo (#PCDATA)>
  ]]>

  <!ELEMENT texto (#PCDATA)>
  <!ELEMENT firma (#PCDATA)>
]>

<sistema>
  <usuario nombre="Ana" avatar="foto_usuario" />
  
  <mensaje>
    <texto>Hola, este es un mensaje de prueba.</texto>
    <firma>Ana G.</firma>
  </mensaje>
</sistema>
```

---

### 4. Recomendaciones de YouTube

Como estos temas son de nivel más avanzado, suelen aparecer hacia el final de los cursos completos de XML. Te recomiendo buscar estos para ver ejemplos en vivo:

- **[XML DTD - Uso de INCLUDE e IGNORE]**: Hay píldoras sueltas en canales como el de _Sergio Luján Mora_ (dentro de su lista de XML) donde te enseña cómo activar y desactivar bloques enteros al vuelo.
    
- **[Entidades externas no analizadas (NDATA y NOTATION)]**: Muchos tutoriales genéricos de "XML avanzado" cubren cómo insertar imágenes en XML. Aunque el XML no "muestra" la imagen como hace el HTML, es genial ver cómo se le dice al sistema operativo qué programa debe usar para abrirla.


<hr style="height:4px;border:none;color:#333;background-color:#FF0000;" />


¡Llegamos al final del recorrido con el **Punto 7: Espacios de Nombres (Namespaces)**!

## Si has llegado hasta aquí, estás a punto de dominar la parte más fundamental cuando mezclas información de diferentes fuentes en un solo documento. Imagina que juntas dos bases de datos y de repente hay un "choque de trenes" porque ambas usan la misma palabra para cosas distintas. Los _namespaces_ son la solución.

### 1. Explicación: ¿Qué son y cómo evitan el caos?

Un espacio de nombres XML (o _namespace_) es simplemente un conjunto de nombres que se identifican mediante una referencia URL. Sirven para evitar conflictos derivados del uso de etiquetas o atributos con el mismo nombre pero que pertenezcan a vocabularios distintos.

**El Problema del Conflicto:** Imagina este código:

XML

```
<cliente>
   <nombre>Juan Pérez</nombre>
   <mascota>
      <nombre>Scooby</nombre>
   </mascota>
</cliente>
```

Si un programa intenta buscar "el `<nombre>`", se volverá loco. ¿Te refieres al nombre del cliente o al nombre de la mascota? Necesitamos distinguirlos.

**La Solución (Prefijos y URLs):** Para declarar un espacio de nombres se usa el atributo mágico `xmlns` ("XML NameSpace"). Puedes hacerlo de dos maneras:

- **Con Prefijo:** Le asignas una abreviatura (como `cli:` para cliente y `pet:` para mascota) que acompañará a la etiqueta. Esa abreviatura se asocia a una URL única. _Nota: la URL no tiene que ser una web real, es solo un identificador único mundial_.
    
- **Por Defecto:** Puedes omitir el prefijo y decir "todo lo que hay dentro de esta caja pertenece a este espacio de nombres, a menos que yo diga lo contrario".
    

**Reglas importantes a recordar:**

- El ámbito de la declaración de un namespace comienza en el elemento en el que se declara y se aplica a todos sus hijos, excepto si se sobrescribe.
    
- Los namespaces por defecto no se aplican a los atributos. Si quieres que un atributo pertenezca a un namespace, debes ponerle prefijo obligatoriamente.
    
- Puedes sobrescribir o desasignar (eliminar) un namespace en mitad del documento igualándolo a unas comillas vacías (`xmlns=""`).
    

---

### 2. Tu Chuleta Rápida (Cheat Sheet)

Ten esto a mano para saber cómo declarar y llamar a los espacios de nombres:

**Sintaxis Incorrecta:**

- `<http://www.libreria.com:Libro />` (Nunca pongas la URL directamente como prefijo).
    

**Declarar y usar un Namespace CON Prefijo:**

- `xmlns:prefijo="URL_UNICA"`
    
- Ejemplo: `<pre:elemento xmlns:pre="http://www.prueba.com" />`
    

**Declarar y usar un Namespace POR DEFECTO (Sin prefijo):**

- `xmlns="URL_UNICA"`
    
- Ejemplo: `<elemento xmlns="http://www.prueba.com" />` (Afecta a todos los hijos que no lleven otro prefijo).
    

**Desasignar (Anular) un Namespace:**

- Por defecto: `<elemento xmlns="" />`
    
- Con prefijo: `<elemento xmlns:pre="" />`
    

---

### 3. Ejemplo Práctico

Aquí tienes cómo quedaría el conflicto del "cliente vs mascota" solucionado de forma profesional usando prefijos:

XML

```
<?xml version="1.0" encoding="UTF-8"?>
<cli:cliente xmlns:cli="http://www.prueba.com/cliente">
  
  <cli:nombre>Juan Pérez</cli:nombre>

  <pet:mascota xmlns:pet="http://www.prueba.com/pet">
    <pet:nombre>Scooby</pet:nombre>
  </pet:mascota>

</cli:cliente>
```

_(Puedes ver que `cli:nombre` se diferencia perfectamente de `pet:nombre`)._

---

### 4. Recomendaciones de YouTube

Los _namespaces_ suelen atragantarse un poco al principio porque mezclan URLs con etiquetas. Estos vídeos te lo dejarán súper claro:

- **[XML Namespaces: Introducción](https://www.youtube.com/watch?v=W0iPwrm8320)** y **[XML Namespaces: Cómo se usa](https://www.youtube.com/watch?v=XhpX-XNdPe8)** (de _TIID / Sergio Luján Mora_): Te recomiendo muchísimo esta miniserie de dos vídeos. Sergio explica visualmente el problema del "choque de nombres" y luego muestra cómo las URIs lo solucionan a la perfección.
    
- **[XML namespaces. XML espacios de nombres](https://www.youtube.com/watch?v=eXmVjvRzNR8)** (del canal _Pepe Lluyot_): Es un vídeo más largo y tipo clase magistral, pero es excelente porque muestra ejemplos de integración reales (mezclando por ejemplo código XML de vectores SVG con código de rutas GPX en el mismo archivo).
