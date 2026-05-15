import '../models/medication.dart';

final Map<String, Medication> medications = {
  'insulina': Medication(
    id: 'insulina',
    name: 'Insulina',
    idealTemperature: '2°C a 8°C',
    alertTitle: 'ALERTA VERMELHO',
    description:
        'Variação de temperatura detectada. Siga as instruções abaixo para reduzir riscos ao paciente.',
    steps: [
      'Interrompa o uso do medicamento até avaliação técnica.',
      'Isole o medicamento imediatamente em local identificado com ALERTA VERMELHO.',
      'Registre a ocorrência: data, horário, temperatura e local de armazenamento.',
      'Comunique o farmacêutico ou responsável técnico.',
      'Verifique o tempo de exposição fora da faixa recomendada.',
      'Aguarde a decisão técnica antes de liberar, descartar ou utilizar o medicamento.',
    ],
    stepIcons: [
      'assets/icon/passo_um.png',
      'assets/icon/passo_dois.png',
      'assets/icon/passo_tres.png',
      'assets/icon/passo_quatro.png',
      'assets/icon/passo_cinco.png',
      'assets/icon/passo_seis.png',
    ],
  ),

  'vacina': Medication(
    id: 'vacina',
    name: 'Vacina',
    idealTemperature: '2°C a 8°C',
    alertTitle: 'ALERTA VERMELHO',
    description:
        'Vacinas são termolábeis e exigem controle rigoroso de temperatura.',
    steps: [
      'Suspender imediatamente o uso das doses afetadas.',
      'Manter as vacinas isoladas e identificadas.',
      'Registrar lote, validade, temperatura e tempo de exposição.',
      'Comunicar a coordenação, farmacêutico ou responsável técnico.',
      'Não descartar sem orientação oficial.',
      'Aguardar avaliação de estabilidade antes de qualquer decisão.',
    ],
    stepIcons: [
      'assets/icon/passo_um.png',
      'assets/icon/passo_dois.png',
      'assets/icon/passo_tres.png',
      'assets/icon/passo_quatro.png',
      'assets/icon/passo_cinco.png',
      'assets/icon/passo_seis.png',
    ],
  ),

  'ampola': Medication(
    id: 'ampola',
    name: 'Ampola',
    idealTemperature: 'Conforme bula/fabricante',
    alertTitle: 'ALERTA VERMELHO',
    description: 'Ampolas podem ter diferentes exigências de conservação.',
    steps: [
      'Suspender o uso da ampola afetada.',
      'Separar o produto do estoque regular.',
      'Consultar a bula ou especificação do fabricante.',
      'Registrar a ocorrência e as condições encontradas.',
      'Comunicar o responsável técnico.',
      'Utilizar somente após liberação técnica.',
    ],
    stepIcons: [
      'assets/icon/passo_um.png',
      'assets/icon/passo_dois.png',
      'assets/icon/passo_tres.png',
      'assets/icon/passo_quatro.png',
      'assets/icon/passo_cinco.png',
      'assets/icon/passo_seis.png',
    ],
  ),

  'hormonios': Medication(
    id: 'hormonios',
    name: 'Hormônios',
    idealTemperature: 'Geralmente 2°C a 8°C, conforme fabricante',
    alertTitle: 'ALERTA VERMELHO',
    description:
        'Hormônios podem perder estabilidade quando expostos a temperaturas inadequadas.',
    steps: [
      'Interrompa o uso do produto.',
      'Isole o medicamento em área segura.',
      'Identifique o item com alerta de variação térmica.',
      'Registre temperatura, tempo e lote.',
      'Comunique o responsável técnico.',
      'Aguarde avaliação antes de uso ou descarte.',
    ],
    stepIcons: [
      'assets/icon/passo_um.png',
      'assets/icon/passo_dois.png',
      'assets/icon/passo_tres.png',
      'assets/icon/passo_quatro.png',
      'assets/icon/passo_cinco.png',
      'assets/icon/passo_seis.png',
    ],
  ),

  'anticorpos monoclonais': Medication(
    id: 'anticorpos monoclonais',
    name: 'Anticorpos Monoclonais',
    idealTemperature: '2°C a 8°C, sem congelamento',
    alertTitle: 'ALERTA VERMELHO',
    description: 'Medicamentos biológicos exigem controle térmico rigoroso.',
    steps: [
      'Não utilizar o medicamento até avaliação.',
      'Não congelar, agitar ou expor à luz intensa.',
      'Isole o produto e sinalize ALERTA VERMELHO.',
      'Registre lote, temperatura e tempo de exposição.',
      'Acione o farmacêutico ou responsável técnico.',
      'Verifique orientação do fabricante antes da decisão final.',
    ],
    stepIcons: [
      'assets/icon/passo_um.png',
      'assets/icon/passo_dois.png',
      'assets/icon/passo_tres.png',
      'assets/icon/passo_quatro.png',
      'assets/icon/passo_cinco.png',
      'assets/icon/passo_seis.png',
    ],
  ),

  'hemoderivados': Medication(
    id: 'hemoderivados',
    name: 'Hemoderivados',
    idealTemperature: 'Conforme produto e fabricante',
    alertTitle: 'ALERTA VERMELHO',
    description:
        'Hemoderivados exigem rastreabilidade e controle de conservação.',
    steps: [
      'Suspender imediatamente o uso.',
      'Isolar o produto em local identificado.',
      'Registrar lote, validade, temperatura e tempo de exposição.',
      'Comunicar o serviço responsável e o farmacêutico.',
      'Não devolver ao estoque sem avaliação.',
      'Aguardar decisão técnica documentada.',
    ],
    stepIcons: [
      'assets/icon/passo_um.png',
      'assets/icon/passo_dois.png',
      'assets/icon/passo_tres.png',
      'assets/icon/passo_quatro.png',
      'assets/icon/passo_cinco.png',
      'assets/icon/passo_seis.png',
    ],
  ),

  'antibiotico injetavel': Medication(
    id: 'antibiotico injetavel',
    name: 'Antibiótico Injetável',
    idealTemperature: 'Conforme bula/fabricante',
    alertTitle: 'ALERTA VERMELHO',
    description:
        'Antibióticos injetáveis podem ter estabilidade afetada por variação térmica.',
    steps: [
      'Suspender o uso do medicamento afetado.',
      'Separar do estoque disponível para uso.',
      'Consultar bula e dados de estabilidade.',
      'Registrar a ocorrência.',
      'Comunicar o farmacêutico ou responsável técnico.',
      'Usar somente após liberação formal.',
    ],
    stepIcons: [
      'assets/icon/passo_um.png',
      'assets/icon/passo_dois.png',
      'assets/icon/passo_tres.png',
      'assets/icon/passo_quatro.png',
      'assets/icon/passo_cinco.png',
      'assets/icon/passo_seis.png',
    ],
  ),
};