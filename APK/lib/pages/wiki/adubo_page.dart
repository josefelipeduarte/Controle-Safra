import 'package:flutter/material.dart';

class AduboPage extends StatelessWidget {
  const AduboPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qual adubo usar?'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              'Escolha de Adubos para Melhorar a Produtividade',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'O uso adequado de adubos é crucial para garantir que suas plantas tenham todos os nutrientes necessários para um crescimento saudável e produtivo. Aqui estão algumas dicas para escolher o adubo certo para suas culturas:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '1. Conheça as Necessidades Nutricionais das Suas Culturas',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'Cada cultura tem necessidades específicas de nutrientes. Por isso, é fundamental conhecer as exigências nutricionais das plantas que você cultiva. Por exemplo, o milho tem alta demanda por nitrogênio, enquanto o feijão precisa de mais fósforo. Realize uma análise do solo para entender melhor o que suas plantas necessitam.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '2. Adubos Orgânicos',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'Os adubos orgânicos, como o composto, esterco de animais e resíduos vegetais, são excelentes para melhorar a estrutura do solo e aumentar sua fertilidade a longo prazo. Além disso, eles ajudam a reter a umidade no solo e promovem a biodiversidade.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '3. Adubos Químicos',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'Os adubos químicos fornecem nutrientes de forma mais rápida para as plantas. No entanto, eles devem ser usados com cuidado, para evitar a salinização do solo e a contaminação das águas. O uso de fertilizantes nitrogenados, fósforos e potássio pode ser adequado para culturas específicas, dependendo da fase de crescimento.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '4. Adubos Foliares',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'Os adubos foliares são aplicados diretamente nas folhas das plantas e são absorvidos mais rapidamente. Eles são úteis para corrigir deficiências de nutrientes de maneira rápida, especialmente em situações de estresse ou durante o ciclo de crescimento acelerado.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '5. Adubação Verde',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'A adubação verde envolve o cultivo de plantas específicas para enriquecer o solo com nutrientes. Essas plantas fixam nitrogênio no solo, melhorando sua qualidade e fertilidade. A soja, por exemplo, é muito utilizada nesse tipo de prática.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '6. Defina a Quantidade de Adubo Corretamente',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'Usar a quantidade certa de adubo é essencial. O uso excessivo pode levar à queima das plantas e poluição do meio ambiente, enquanto a quantidade insuficiente pode prejudicar o crescimento e desenvolvimento das culturas. A recomendação é seguir as instruções dos fabricantes e as orientações baseadas em análises do solo.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '7. Alternando Adubos Orgânicos e Químicos',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'Uma boa prática é alternar o uso de adubos orgânicos e químicos, criando um equilíbrio entre o fortalecimento do solo e o fornecimento rápido de nutrientes para as plantas. Isso pode ajudar a manter a saúde do solo a longo prazo e melhorar a produtividade das suas culturas.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '8. Adubação de Microelementos',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'Além dos macronutrientes (nitrogênio, fósforo e potássio), as plantas também precisam de microelementos, como ferro, cobre e zinco. A deficiência desses nutrientes pode afetar o desenvolvimento das plantas e a qualidade da colheita. Se necessário, adicione esses elementos à sua rotina de adubação.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '9. Evite a Superfertilização',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'A superfertilização é o uso excessivo de fertilizantes, o que pode causar danos ao solo e às plantas, além de aumentar os custos de produção. Fique atento à quantidade de adubo que está utilizando e procure sempre otimizar o uso dos nutrientes.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '10. Considerações Finais',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              'Escolher o adubo certo para a sua lavoura depende de diversos fatores, como o tipo de cultura, as condições do solo e a fase de crescimento das plantas. Faça sempre uma análise detalhada e busque orientação profissional, quando necessário, para garantir que suas plantas recebam os nutrientes ideais para um crescimento saudável e produtivo.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
