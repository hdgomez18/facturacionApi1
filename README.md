# facturacionApi1
¿Cómo se podría asegurar una alta disponibilidad de los recursos expuestos en el API REST?
Para tener tanto una alta disponibilidad como un alto rendimiento es necesario hacer balanceadores de carga para que acepte el número máximo de peticiones posible y dividir el trafico entre distintos servidores que sean capaces de soportar todo el tráfico necesario.

¿Qué capas incluiría para soportar operaciones asíncronas?
La vista al usuario, el loop de eventos con un solo hilo de ejecución, los subprocesos con multihilos asincrónicos, y la capa de bbdd donde se delegan las operaciones de los subprocesos para devolver al loop y enviar a la vista.

¿Qué otras tecnologías manejarían o cambiaría dentro de su implementación?
Bueno en el mercado hay una amplia variedad de tecnologías para el soporte y desarrollo de web api, casi se encuentra framework por lenguaje, por ejemplo, django rest y flask en Python, expressJs en nodeJs, Laravel para php o Spring para java y entre los tester yo acostumbro trabajar con postman, en cloud de aws se encuentra la api Gateway o jenkis.
