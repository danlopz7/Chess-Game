# # args = ARGV[0..1]
# # puts args.class

# # puts "#{args[0]} y #{args[1]}"


# def obtain_coordinate(current_coordinate)
#     # Simulación de un método que verifica si la coordenada es correcta
#     # En este ejemplo, la coordenada es incorrecta si es igual a 'A1'
#     return nil if current_coordinate == 'A1'
  
#     # Si la coordenada no es incorrecta, devuelve las coordenadas
#     # (en este caso, solo devuelve [1, 1] para la coordinada 'B1')
#     [1, 1]
#   end
  
#   # Utilizamos un bucle 'begin..end until' para solicitar coordenadas al usuario
#   begin
#     puts 'Ingresa una coordenada (por ejemplo, B1): '
#     current_coordinate = gets.chomp
  
#     # Llamamos a obtain_coordinate para verificar si la coordenada es correcta
#     x, y = obtain_coordinate(current_coordinate)
  
#     # Si las coordenadas son nil, mostramos un mensaje de error y repetimos el bucle
#     unless x
#       puts 'Coordenada incorrecta. Intenta de nuevo.'
#     end
#   end until x

#   # Cuando las coordenadas son correctas, salimos del bucle y continuamos aquí
#   puts "Coordenadas correctas: #{x}"

  input = gets.chomp
  coordenadas = input.split(' ')
  puts "#{coordenadas}"
  current_coordinate = coordenadas[0]
  to_coordinate = coordenadas[1]
  letra = current_coordinate[0]
  numero = current_coordinate[1]
  puts "#{letra} y #{numero}"

  puts "#{current_coordinate} is #{current_coordinate.class} & #{to_coordinate}#{to_coordinate.class}"
    