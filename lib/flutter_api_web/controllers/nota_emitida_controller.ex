defmodule FlutterApiWeb.NotaEmitidaController do
  use FlutterApiWeb, :controller

  # In-memory database of notas emitidas
  @notas_emitidas [
    %{
      id: 1,
      pessoa_id: 1,
      nomePessoa: "Empresa A Ltda",
      formaDeRecebimento_id: 1,
      emissao: "2025-03-01T10:30:00",
      emissaoFatura: "2025-03-01T10:35:00",
      estado: "EFETIVADO",
      itens: [
        %{
          id: 1,
          item_id: 1,
          nomeItem: "Produto A",
          unitario: 50.00,
          unitarioOriginal: 55.00,
          quantidade: 2.0,
          total: 100.00,
          vendedor_id: 1,
          observacao: "Produto de alta qualidade",
          porcentagemDesconto: 9.09,
          desconto: 10.00,
          totalOriginal: 110.00,
          unitarioConvertido: 50.00,
          totalConvertido: 100.00,
          horaDoPedido: "2025-03-01T10:25:00",
          itemDevolvidoId: nil
        },
        %{
          id: 2,
          item_id: 3,
          nomeItem: "Produto C",
          unitario: 75.00,
          unitarioOriginal: 75.00,
          quantidade: 1.0,
          total: 75.00,
          vendedor_id: 1,
          observacao: "",
          porcentagemDesconto: 0.00,
          desconto: 0.00,
          totalOriginal: 75.00,
          unitarioConvertido: 75.00,
          totalConvertido: 75.00,
          horaDoPedido: "2025-03-01T10:27:00",
          itemDevolvidoId: nil
        }
      ],
      desconto: 10.00,
      acrescimo: 0.00,
      totalEmDinheiro: 175.00,
      porcentagemDesconto: 5.41,
      usuario_id: 1,
      moeda_id: 1,
      condicaoDeVenda: "avista",
      totalItens: 175.00,
      totalItensOriginal: 185.00,
      totalNota: 175.00,
      operacaoFinanceira: "ENTRADA",
      observacao: "",
      quantidadeItens: 2.0,
      vendedor_id: 1,
      codigoTransacao: "TX-001",
      numeroDeParcelas: 1,
      isOfflineCreatedPessoa: false,
      tipo: "VENDA",
      fatura: true,
      estadoNotaEletronica: "EM_DEFINICAO",
      numeroCDC: "",
      #idsNotasDevolvidas: []
    },
    %{
      id: 2,
      pessoa_id: 2,
      nomePessoa: "Empresa B Ltda",
      formaDeRecebimento_id: 2,
      emissao: "2025-03-02T14:15:00",
      emissaoFatura: "2025-03-02T14:20:00",
      estado: "EFETIVADO",
      itens: [
        %{
          id: 3,
          item_id: 2,
          nomeItem: "Produto B",
          unitario: 120.00,
          unitarioOriginal: 150.00,
          quantidade: 3.0,
          total: 360.00,
          vendedor_id: 1,
          observacao: "Promoção especial",
          porcentagemDesconto: 20.00,
          desconto: 90.00,
          totalOriginal: 450.00,
          unitarioConvertido: 120.00,
          totalConvertido: 360.00,
          horaDoPedido: "2025-03-02T14:10:00",
          itemDevolvidoId: nil
        },
        %{
          id: 4,
          item_id: 5,
          nomeItem: "Produto E",
          unitario: 200.00,
          unitarioOriginal: 200.00,
          quantidade: 1.0,
          total: 200.00,
          vendedor_id: 1,
          observacao: "",
          porcentagemDesconto: 0.00,
          desconto: 0.00,
          totalOriginal: 200.00,
          unitarioConvertido: 200.00,
          totalConvertido: 200.00,
          horaDoPedido: "2025-03-02T14:12:00",
          itemDevolvidoId: nil
        },
        %{
          id: 5,
          item_id: 6,
          nomeItem: "Produto F",
          unitario: 80.00,
          unitarioOriginal: 80.00,
          quantidade: 2.0,
          total: 160.00,
          vendedor_id: 1,
          observacao: "",
          porcentagemDesconto: 0.00,
          desconto: 0.00,
          totalOriginal: 160.00,
          unitarioConvertido: 80.00,
          totalConvertido: 160.00,
          horaDoPedido: "2025-03-02T14:13:00",
          itemDevolvidoId: nil
        }
      ],
      desconto: 90.00,
      acrescimo: 0.00,
      totalEmDinheiro: 720.00,
      porcentagemDesconto: 11.11,
      usuario_id: 1,
      moeda_id: 1,
      condicaoDeVenda: "avista",
      totalItens: 720.00,
      totalItensOriginal: 810.00,
      totalNota: 720.00,
      operacaoFinanceira: "ENTRADA",
      observacao: "",
      quantidadeItens: 3.0,
      vendedor_id: 1,
      codigoTransacao: "TX-002",
      numeroDeParcelas: 1,
      isOfflineCreatedPessoa: false,
      tipo: "VENDA",
      fatura: true,
      estadoNotaEletronica: "EM_DEFINICAO",
      numeroCDC: "",
      #idsNotasDevolvidas: []
    },
    %{
      id: 3,
      pessoa_id: 3,
      nomePessoa: "João da Silva",
      formaDeRecebimento_id: 4,
      emissao: "2025-03-03T09:45:00",
      emissaoFatura: "2025-03-03T09:50:00",
      estado: "EFETIVADO",
      itens: [
        %{
          id: 6,
          item_id: 4,
          nomeItem: "Produto D",
          unitario: 300.00,
          unitarioOriginal: 350.00,
          quantidade: 1.0,
          total: 300.00,
          vendedor_id: 1,
          observacao: "Cliente fidelidade",
          porcentagemDesconto: 14.29,
          desconto: 50.00,
          totalOriginal: 350.00,
          unitarioConvertido: 300.00,
          totalConvertido: 300.00,
          horaDoPedido: "2025-03-03T09:40:00",
          itemDevolvidoId: nil
        },
        %{
          id: 7,
          item_id: 8,
          nomeItem: "Produto H",
          unitario: 45.00,
          unitarioOriginal: 45.00,
          quantidade: 4.0,
          total: 180.00,
          vendedor_id: 1,
          observacao: "",
          porcentagemDesconto: 0.00,
          desconto: 0.00,
          totalOriginal: 180.00,
          unitarioConvertido: 45.00,
          totalConvertido: 180.00,
          horaDoPedido: "2025-03-03T09:42:00",
          itemDevolvidoId: nil
        }
      ],
      desconto: 50.00,
      acrescimo: 0.00,
      totalEmDinheiro: 0.00,
      porcentagemDesconto: 9.43,
      usuario_id: 1,
      moeda_id: 1,
      condicaoDeVenda: "aprazo",
      totalItens: 480.00,
      totalItensOriginal: 530.00,
      totalNota: 480.00,
      operacaoFinanceira: "ENTRADA",
      observacao: "Parcelado em 3x",
      quantidadeItens: 2.0,
      vendedor_id: 1,
      codigoTransacao: "TX-003",
      numeroDeParcelas: 3,
      isOfflineCreatedPessoa: false,
      tipo: "VENDA",
      fatura: true,
      estadoNotaEletronica: "EM_DEFINICAO",
      numeroCDC: "CDC-001",
      #idsNotasDevolvidas: []
    },
    %{
      id: 4,
      pessoa_id: 4,
      nomePessoa: "Maria dos Santos",
      formaDeRecebimento_id: 7,
      emissao: "2025-03-03T16:20:00",
      emissaoFatura: "2025-03-03T16:25:00",
      estado: "EFETIVADO",
      itens: [
        %{
          id: 8,
          item_id: 5,
          nomeItem: "Produto E",
          unitario: 190.00,
          unitarioOriginal: 200.00,
          quantidade: 2.0,
          total: 380.00,
          vendedor_id: 1,
          observacao: "Desconto para compra em quantidade",
          porcentagemDesconto: 5.00,
          desconto: 20.00,
          totalOriginal: 400.00,
          unitarioConvertido: 190.00,
          totalConvertido: 380.00,
          horaDoPedido: "2025-03-03T16:15:00",
          itemDevolvidoId: nil
        },
        %{
          id: 9,
          item_id: 9,
          nomeItem: "Produto I",
          unitario: 60.00,
          unitarioOriginal: 60.00,
          quantidade: 3.0,
          total: 180.00,
          vendedor_id: 1,
          observacao: "",
          porcentagemDesconto: 0.00,
          desconto: 0.00,
          totalOriginal: 180.00,
          unitarioConvertido: 60.00,
          totalConvertido: 180.00,
          horaDoPedido: "2025-03-03T16:17:00",
          itemDevolvidoId: nil
        },
        %{
          id: 10,
          item_id: 10,
          nomeItem: "Produto J",
          unitario: 25.00,
          unitarioOriginal: 25.00,
          quantidade: 5.0,
          total: 125.00,
          vendedor_id: 1,
          observacao: "",
          porcentagemDesconto: 0.00,
          desconto: 0.00,
          totalOriginal: 125.00,
          unitarioConvertido: 25.00,
          totalConvertido: 125.00,
          horaDoPedido: "2025-03-03T16:18:00",
          itemDevolvidoId: nil
        }
      ],
      desconto: 20.00,
      acrescimo: 0.00,
      totalEmDinheiro: 685.00,
      porcentagemDesconto: 2.84,
      usuario_id: 1,
      moeda_id: 1,
      condicaoDeVenda: "avista",
      totalItens: 685.00,
      totalItensOriginal: 705.00,
      totalNota: 685.00,
      operacaoFinanceira: "ENTRADA",
      observacao: "Pagamento via PIX",
      quantidadeItens: 3.0,
      vendedor_id: 1,
      codigoTransacao: "TX-004",
      numeroDeParcelas: 1,
      isOfflineCreatedPessoa: false,
      tipo: "VENDA",
      fatura: true,
      estadoNotaEletronica: "AUTORIZADA",
      numeroCDC: "",
      #idsNotasDevolvidas: []
    },
    %{
      id: 5,
      pessoa_id: 5,
      nomePessoa: "Empresa C S.A.",
      formaDeRecebimento_id: 3,
      emissao: "2025-03-04T11:10:00",
      emissaoFatura: "2025-03-04T11:15:00",
      estado: "EFETIVADO",
      itens: [
        %{
          id: 11,
          item_id: 7,
          nomeItem: "Produto G",
          unitario: 150.00,
          unitarioOriginal: 150.00,
          quantidade: 1.0,
          total: 150.00,
          vendedor_id: 1,
          observacao: "",
          porcentagemDesconto: 0.00,
          desconto: 0.00,
          totalOriginal: 150.00,
          unitarioConvertido: 150.00,
          totalConvertido: 150.00,
          horaDoPedido: "2025-03-04T11:05:00",
          itemDevolvidoId: nil
        },
        %{
          id: 12,
          item_id: 11,
          nomeItem: "Produto K",
          unitario: 90.00,
          unitarioOriginal: 90.00,
          quantidade: 2.0,
          total: 180.00,
          vendedor_id: 1,
          observacao: "",
          porcentagemDesconto: 0.00,
          desconto: 0.00,
          totalOriginal: 180.00,
          unitarioConvertido: 90.00,
          totalConvertido: 180.00,
          horaDoPedido: "2025-03-04T11:07:00",
          itemDevolvidoId: nil
        }
      ],
      desconto: 0.00,
      acrescimo: 0.00,
      totalEmDinheiro: 330.00,
      porcentagemDesconto: 0.00,
      usuario_id: 1,
      moeda_id: 1,
      condicaoDeVenda: "avista",
      totalItens: 330.00,
      totalItensOriginal: 330.00,
      totalNota: 330.00,
      operacaoFinanceira: "ENTRADA",
      observacao: "",
      quantidadeItens: 2.0,
      vendedor_id: 1,
      codigoTransacao: "TX-005",
      numeroDeParcelas: 1,
      isOfflineCreatedPessoa: false,
      tipo: "VENDA",
      fatura: true,
      estadoNotaEletronica: "AUTORIZADA",
      numeroCDC: "",
      #idsNotasDevolvidas: []
    }
  ]

  def vendas_por_vendedor(conn, %{"id" => id}) do
    # Convert id to integer
    id_int = String.to_integer(id)

    # Find notas by vendedor_id
    notas = Enum.filter(@notas_emitidas, fn n -> n.vendedor_id == id_int end)

    conn
    |> put_status(:ok)
    |> json(notas)
  end

  def index(conn, params) do
    size = Map.get(params, "size", "10") |> String.to_integer()
    sort_by = Map.get(params, "sortBy", "id")
    asc = Map.get(params, "asc", "true") == "true"

    # Sort the notas based on parameters
    sorted_notas = sort_notas(@notas_emitidas, sort_by, asc)

    # Apply pagination (limit to size)
    paginated_notas = Enum.take(sorted_notas, size)

    conn
    |> put_status(:ok)
    |> json(paginated_notas)
  end

  def show(conn, %{"id" => id}) do
    # Convert id to integer
    id_int = String.to_integer(id)

    # Find nota by id
    case Enum.find(@notas_emitidas, fn n -> n.id == id_int end) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Nota emitida not found"})

      nota ->
        conn
        |> put_status(:ok)
        |> json(nota)
    end
  end

  # Helper function to sort notas
  defp sort_notas(notas, sort_by, true) do
    Enum.sort_by(notas, fn nota -> Map.get(nota, String.to_atom(sort_by)) end)
  end

  defp sort_notas(notas, sort_by, false) do
    Enum.sort_by(notas, fn nota -> Map.get(nota, String.to_atom(sort_by)) end, :desc)
  end
end
