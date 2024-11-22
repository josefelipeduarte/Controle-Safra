import 'package:flutter/material.dart';

class ProdutividadePage extends StatelessWidget {
  const ProdutividadePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Como melhorar a produtividade?'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              'Como Melhorar a Produtividade das Culturas na Lavoura',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Melhorar a produtividade na lavoura é essencial para maximizar os resultados da sua safra e garantir uma produção mais eficiente e sustentável. Aqui estão algumas práticas e técnicas que podem ajudar a aumentar a produtividade das suas culturas:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '1. Escolha de Sementes de Alta Qualidade',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'A seleção de sementes de boa qualidade é a base para uma lavoura produtiva. Sementes certificadas e adaptadas às condições climáticas e de solo da sua região tendem a apresentar maior resistência a pragas e doenças, além de melhor germinação e desenvolvimento.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '2. Uso Adequado de Fertilizantes',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'A adubação correta é fundamental para suprir as necessidades nutricionais das plantas. Realizar uma análise do solo pode ajudar a determinar quais nutrientes estão em falta, permitindo o uso de fertilizantes adequados para melhorar a saúde das suas culturas. Evite o uso excessivo de fertilizantes, pois isso pode prejudicar o solo e aumentar os custos de produção.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '3. Práticas de Manejo de Irrigação',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'Uma irrigação eficiente é crucial, especialmente em períodos de seca. O uso de sistemas de irrigação por gotejamento ou aspersão, ajustados às necessidades específicas das plantas, pode evitar o desperdício de água e promover um crescimento mais uniforme.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '4. Controle de Pragas e Doenças',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'O controle integrado de pragas (CIP) é uma estratégia eficaz para minimizar danos causados por insetos, fungos e outras pragas. Isso envolve a utilização de pesticidas de forma racional, aliados ao monitoramento contínuo das lavouras e ao uso de variedades resistentes.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '5. Rotação de Culturas',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'A rotação de culturas é uma técnica importante para manter a saúde do solo e evitar o esgotamento dos nutrientes. Além disso, essa prática ajuda a reduzir a incidência de pragas específicas e contribui para uma melhor estrutura do solo.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '6. Manejo Adequado do Solo',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'Mantenha a qualidade do solo por meio de práticas como o cultivo mínimo, a utilização de matéria orgânica e a adoção de técnicas de conservação, como o plantio direto. O solo bem manejado favorece a retenção de água e a circulação de ar, promovendo um ambiente saudável para o crescimento das plantas.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '7. Monitoramento e Análise de Resultados',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'Utilize tecnologias para o monitoramento da lavoura, como sensores e aplicativos de gestão agrícola, para avaliar as condições da plantação em tempo real. A coleta e análise de dados ajudam na tomada de decisões e permitem ajustes rápidos para corrigir problemas antes que eles se agravem.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '8. Adoção de Tecnologias Agrícolas',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'A implementação de tecnologias como drones, sistemas de irrigação automatizada e máquinas agrícolas de precisão pode aumentar significativamente a eficiência do trabalho na lavoura, reduzindo custos operacionais e melhorando o desempenho das culturas.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '9. Uso de Cobertura Vegetal',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'A cobertura do solo com plantas de cobertura ou palhada ajuda a manter a umidade, reduzir a erosão e melhorar a estrutura do solo. Além disso, evita a proliferação de ervas daninhas que competem por nutrientes com as culturas.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '10. Capacitação e Inovação',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'Investir na capacitação contínua e na adoção de novas técnicas e conhecimentos sobre a agricultura de precisão pode resultar em melhores práticas e aumento de produtividade. Participar de cursos, workshops e eventos agrícolas pode trazer novas ideias e soluções inovadoras para a sua lavoura.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
