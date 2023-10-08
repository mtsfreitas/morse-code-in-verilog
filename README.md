# morse-code-in-verilog

# Especificação

Uma Máquina de Estados Finitos (Finite State Machine) é um modelo matemático amplamente utilizado na representação do comportamento de sistemas computacionais e circuitos lógicos em geral. O modelo pode ser genericamente descrito como uma máquina abstrata que sempre deve estar em algum de seus finitos estados, um por vez. O estado no qual a máquina se encontra em dado instante é conhecido como estado atual. Todos os estados armazenam informações sobre o passado, isto é, as mudanças ocorridas desde o início do sistema até o presente momento. Uma transição indica uma mudança de estado e é descrita através de uma condição que precisa ser realizada para que tal transição ocorra. Uma ação é a descrição de uma atividade que deve ser realizada em um determinado momento.

Este trabalho prático consiste no projeto e implementação de uma Máquina de Estados Finitos que simule o comportamento de uma Urna Eletrônica simplificada. A FSM deverá ser responsável por receber o número de um candidato e concluir se o voto é válido ou não, de acordo com as especificações abaixo:
● A urna possui quatro candidatos;
● Os votos são contabilizados individualmente;
● Os candidatos são identificados através de números de 4 dígitos, que deverão corresponder aos últimos 4 dígitos das matrículas dos 4 integrantes do grupo. Números fictícios deverão ser propostos por grupos com menos de 4 integrantes;
● Qualquer voto destinado a um número inválido (diferente dos números de todos os candidatos cadastrados) é contabilizado como nulo;
● O pleito elege um único candidato. Isso significa que um eleitor pode votar em somente um dos quatro candidatos disponíveis.

A figura abaixo apresenta o diagrama básico do módulo Urna. A descrição detalhada das interfaces de entrada e saída é apresentada na Tabela 1.

![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/9de0e9b4-ab2e-43af-b84d-ddc74fe3cbbf)

Figura 1. Diagrama de entradas e saídas do módulo Urna

![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/48804d61-b8a9-414b-8b22-a4ba03f3a272)

![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/9869c810-d8cd-4916-af3e-bbf47b9d8ea5)

Tabela 1. Descrição dos sinais do módulo Urna.

A linguagem de descrição de hardware Verilog deverá ser utilizada para descrever o circuito tanto em ambiente virtual (simulação) quanto em ambiente físico (FPGA). Ao final, seu design deverá ser capaz de receber um número, dígito por dígito, concluir se o número corresponde a um voto válido ou nulo, contabilizar a informação e apresentar os resultados finais.

Atenção: A Máquina de Estados Finitos deve ser projetada de forma a permitir que os votos sejam lidos, processados e contabilizados até que o sinal de controle finish seja ativado. Construa seus estados de forma que tal comportamento seja permitido.

# 1. Etapas do desenvolvimento

A linguagem de descrição de hardware Verilog deverá ser utilizada para descrever o circuito tanto em ambiente virtual (simulação) quanto em ambiente físico (FPGA). Ao final, seu design deverá ser capaz de receber um número, dígito por dígito, concluir se o número corresponde a um voto válido ou nulo, contabilizar a informação e apresentar os resultados finais.

Atenção: A Máquina de Estados Finitos deve ser projetada de forma a permitir que os votos sejam lidos, processados e contabilizados até que o sinal de controle finish seja ativado. Construa seus estados de forma que tal comportamento seja permitido.


# Objetivo

O objetivo desta prática consistiu em elaborar um projeto que envolveu o levantamento das equações booleanas para cada saída, a simplificação destas através do mapa de Karnaugh e apresentação de suas formas canônicas e reduzidas do Mintermo e Maxtermo, a representação do circuito resultante com portas lógicas, a implementação do módulo em Verilog HDL bem como sua simulação e por fim a visualização das formas de onda das simulações.

![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/60b4d002-4e66-46a4-b9f4-b4e30b36c2a5)

# Formas Canônicas

## Mintermo
![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/a5e7bbe3-c18c-4edf-ba45-230dbcc35439)

## Maxtermo
![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/8020fd12-3009-491d-a50f-a962d5a6bae9)

# Formas Minimizadas

## Mintermo
![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/b7e5697e-2a58-42f9-af77-0150c716251f)

## Maxtermo
![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/2b1cebb7-c19b-4560-bb73-a47abbb5c7f4)

# Circuito

Representação do circuito a partir de portas lógicas com as expressões booleanas simplificadas pelo mapa de Karnaugh (representação em maxtermo):

![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/7bb9ba49-2337-4189-8806-8383587e0a76)

# Outra abordagem 

Note que as expressões de Mintermo podem ser simplificadas através da propriedade booleana de distributividade e o circuito equivalente pode ser visto abaixo:

## Mintermo
![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/e58413d3-0ece-4781-be35-40e9eddeb9e3)

![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/30c7af95-a0c1-4186-94ec-1860dc11ed83)

Para implementar os sinais de controle, consideramos os seguinte: Para o sinal reset consideramos que a saída se torna um valor inválido não contemplado pelos valores de entrada de 0 a 9 do Código Morse, sendo ele o valor 10 (01010), optamos por isso, ao invés de zerar todos os bits de saída, pois esse seria uma entrada válida. A funcionalidade do reset só é 
observada na borda de subida (de 0 para 1).

Para o sinal ready consideramos que o código é computado (saída altera conforme a entrada) apenas na borda de subida do sinal (de 0 para 1).

Após a execução obtivemos o seguinte resultado na tela:

![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/4824a8b0-06dc-4324-a091-47a94cc3dee5)

Formas de ondas da simulação:

![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/c98d7805-f1f0-4a52-a926-8a2f25e6ad82)

# FPGA

O arquivo “teste.v” é onde está definido a inclusão do arquivo “numero.v” e a comunicação dos elementos de entrada e saída do dispositivo com a função “fnumero”, para o devido funcionamento do módulo na FPGA (Field Programmable Gate Array).

Sendo no painel da máquina as chaves SW (switch) para “entrada” definida de 0 a 3 (4 bits), “reset” na última posição 17 (1 bit), “ready” para a penúltima 16 (1 bit) e tendo como “saída” os LEDs vermelhos nas posições de 0 a 4 (5 bits).

![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/642c23ad-90e8-48c7-a59f-6bc37004d9d1)

Após a compilação do programa no circuito integrado, o mesmo inicia-se com a entrada 01010, indicando uma entrada inválida definida pelo “initial begin”, sendo o mesmo valor definido ao “reset” quando estiver ativado. A troca dos valores se dá ao ativar o “ready” após inserir a entrada válida para a conversão, estando com o “reset” desativado.

# Conclusão

Neste trabalho observamos que a simplificação das equações booleanas através do mapa de Karnaugh se mostrou muito eficiente, uma vez que as mesmas foram simplificadas a tal ponto que foram necessárias menos portas lógicas para a construção do circuito.

Além disso, a aplicação da propriedade distributiva foi capaz de simplificar a escrita de algumas das equações. Por outro lado, teve um aumento no número de portas lógicas que exigem menos entradas e portanto podem ser mais baratas dependendo da complexidade do circuito.

Observamos também que pelas ondas geradas através do código de teste, conseguimos observar o fluxo do funcionamento, obedecendo os sinais de controle, sendo esta uma ferramenta eficaz na visualização do comportamento das entradas e saídas.

Ao compilar o programa no Quartus para a FPGA, nós pudemos observar com sucesso as funcionalidades do planejamento de todo o trabalho proposto realizado com o grupo, passando do lado abstrato (codificação) para o concreto (palpável).

# Referências

VERILOG TUTORIAL FOR BEGINNERS. Disponível em: 
<http://referencedesigner.com/tutorials/verilog/verilog_01.php>. Acesso em: 12 out. 2018

VERILOG TUTORIAL. Disponível em: <http://www.asic-world.com/verilog/veritut.html>. Acesso em: 12 out. 2018

DOWNLOAD ICARUS VERILOG . Disponível em: <http://bleyer.org/icarus>. Acesso em: 12 out. 2018

DOWNLOAD GTKWAVE. Disponível em: <http://www.dspia.com/gtkwave.html>. Acesso em: 12 out. 2018

DOWNLOAD Quartus Prime Lite Edition. Disponível em: <http://fpgasoftware.intel.com/?edition=lite>. Acesso em: 29 out. 2018
