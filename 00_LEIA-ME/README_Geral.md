# Artefatos e evidências da pesquisa

Este repositório reúne materiais produzidos durante a pesquisa de doutorado sobre o desenvolvimento ágil validado em ambientes regulados (BPx). Os arquivos documentam a revisão integrativa, a engenharia de software, a avaliação de riscos, a rastreabilidade dos artefatos e as evidências dos testes da aplicação experimental.

## Organização do repositório

- **`01_Engenharia_e_Rastreabilidade/`** — contém a matriz consolidada de rastreabilidade dos artefatos da engenharia de software e os arquivos de avaliação de riscos por avaliador.
- **`02_Evidencias_de_Testes/`** — reúne evidências dos cenários de teste, organizadas por identificador (`CT-001`, `CT-002` etc.). Inclui resultados de testes automatizados, verificações manuais, consultas ao banco de dados, logs e capturas de tela.
- **`03_Revisao_Integrativa/`** — contém a planilha de documentação do percurso da revisão integrativa e da análise das referências utilizadas na pesquisa.

## Organização das evidências de testes

Cada pasta de cenário reúne os registros relacionados ao respectivo teste. Quando disponíveis, as evidências estão separadas em:

- **Testes automatizados:** relatórios em JSON e HTML e capturas de tela geradas durante a execução.
- **Verificações manuais e de banco de dados:** logs, consultas SQL, resultados de consultas e capturas de tela produzidas manualmente.

As evidências automatizadas podem estar organizadas por execução, identificada pela data e pelo horário. Pastas de origem que estavam divididas em partes, como `CT-001_Evidencias_01` e `CT-001_Evidencias_02`, foram agrupadas sob o cenário correspondente. Quando as partes pertencem a execuções diferentes, essa distinção é preservada na organização.

## Planilhas de rastreabilidade e riscos

A matriz consolidada documenta as relações entre os artefatos de engenharia de software, incluindo unidades de valor, requisitos funcionais, histórias de usuário, critérios de aceitação, riscos, controles sistêmicos e cenários de teste. Os arquivos de avaliação por avaliador complementam os registros de análise de riscos.

## Revisão integrativa

A planilha `Documentacao_Revisao_Integrativa.xlsx` documenta etapas da revisão, como a delimitação dos eixos temáticos, as consultas realizadas no SciSpace, os critérios de seleção e apreciação qualitativa, a consolidação das referências e a busca documental complementar. Também registra a análise das 93 referências em relação às dez premissas e a contribuição das evidências para a derivação dessas premissas e sua aplicação no framework.

## Identificação do repositório

- **Título da pesquisa:** Desenvolvimento Ágil Validado em Ambientes Regulados: Proposição de um Framework Baseado em Risco para Desenvolvimento de Softwares com Impacto BPx
- **Autoria:** Kellen Cristina de Almeida Nery
- **Instituição:** Farmanguinhos/Fiocruz
- **Versão do conjunto de arquivos:** 12/11/2026 - versão 1.0
- **DOI:** https://doi.org/10.6084/m9.figshare.34989514

## Observação

Os arquivos são disponibilizados para consulta e compreensão dos procedimentos e artefatos da pesquisa. Para interpretar um resultado específico, consulte a pasta do cenário de teste correspondente e os registros associados à sua execução.
