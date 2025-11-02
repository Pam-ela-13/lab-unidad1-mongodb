-------------------------------------------------------------
         PROYECTO
-------------------------------------------------------------

Nombre: Pamela Tapia

Justificación del Modelo Dual

Las organizaciones manejan distintos tipos de datos que requieren soluciones tecnológicas complementarias. En el caso de TechStore, se ha adoptado un modelo dual que integra bases de datos relacionales (SQL) y bases de datos NoSQL, aprovechando las ventajas particulares de cada tecnología.

El sistema SQL se utiliza para gestionar las transacciones de ventas, clientes y sucursales, debido a que requiere consistencia, integridad referencial y estructuras rígidas que garanticen la validez de la información.

Por otro lado, el sistema NoSQL (MongoDB) se emplea para administrar el catálogo de productos, que incluye atributos flexibles y estructuras anidadas (como especificaciones técnicas). MongoDB permite almacenar documentos con distintos campos sin necesidad de un esquema fijo, lo que resulta ideal para productos tecnológicos que cambian constantemente o que tienen descripciones variables según el modelo o fabricante.

La combinación de ambos modelos permite mantener la integridad transaccional en ventas (SQL) y, al mismo tiempo, flexibilidad y agilidad en la gestión del inventario (NoSQL).


Informe de Calidad de Datos
Problemas potenciales de calidad de datos en los sistemas de origen. 
    1. Un registro en la tabla Detalle_Ventas podría referenciar un sku_producto que no existe en la base de datos MongoDB. Puede tener una Inconsistencia entre sistemas y errores al integrar datos para reportes de ventas por producto.

    2. En MongoDB, dos productos diferentes podrían tener el mismo valor de sku si no se aplica un índice único. Duplicidad de productos, errores en el control de inventario y confusión en el análisis de ventas.

    3. Datos inválidos o incompletos, dificultando campañas de marketing o análisis de comportamiento. En la tabla Clientes, el campo email podría estar nulo o mal formado, afectando la comunicación y segmentación de clientes.

Para mitigar estos problemas, se recomienda implementar validaciones automáticas (índices únicos, restricciones NOT NULL, validadores de formato).

El uso de un modelo dual SQL–NoSQL en TechStore permite aprovechar lo mejor de ambos mundos: consistencia estructurada en las transacciones y flexibilidad en la gestión de productos. No obstante, la calidad de los datos debe mantenerse bajo control, ya que cualquier error en los sistemas fuente afectará directamente la confiabilidad de la futura solución de Business Intelligence.