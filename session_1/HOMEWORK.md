Excercise 1: Bookstore
----------------------

Tip: use extensively pattern matching

A certain book store has offices in Texas (TX) and North Carolina (NC),
so we have to charge sales tax on orders shipped to these states. The
rates can be expressed as a keyword list

```elixir
tax_rates = [ NC: 0.075, TX: 0.08 ]

Here’s a list of orders:

orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount:  35.50 ], 
  [ id: 125, ship_to: :TX, net_amount:  24.00 ],
  [ id: 126, ship_to: :TX, net_amount:  44.80 ],
  [ id: 127, ship_to: :NC, net_amount:  25.00 ],
  [ id: 128, ship_to: :MA, net_amount:  10.00 ],
  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ id: 120, ship_to: :NC, net_amount:  50.00 ] ]
```
  
Write a function that takes both lists and returns a copy of the orders,
but with an extra field,  total_amount which is the net plus sales tax. If a
shipment is not to NC or TX, there’s no tax applied.

Excercise 2: Process ring
-------------------------

Implementar un anillo de 5 procesos idénticos. Cada proceso puede recibir un mensaje con la siguiente estructura

    {mensaje, n}

Cuando recibe el mensaje, reenvía el mensaje a el siguiente proceso en el anillo, y este proceso se repite hasta que n procesos han recibido el mensaje. Ejemplo: si mis procesos se llaman respectivamente 'a','b','c','d' y 'e', y envío a 'a' el mensaje {"hola", 7}, el último proceso que recibe el mensaje es B (el primer proceso que recibe el mensaje también cuenta). Los procesos deben permanecer vivos en tanto no se les envíe el mensaje :exit, en cuyo caso simplemente terminan dejando de escuchar mensajes. 

Crear también un proceso que:

1. inicializa el anillo, iniciando cada proceso con 'spawn_monitor'
2. al inicializar regresa la lista de los pid's que conforman el anillo.
3. una vez inicializado el anillo, espera a que mueran TODOS los procesos del anillo (recibe un mensaje del tipo {:DOWN, _, _, PID, _} cada que un proceso termina). Ya que todos terminaron, este proceso también termina.
4. también puede recibir el mensaje :exit, en cuyo caso envía el mensaje de terminación a los procesos del anillo.

