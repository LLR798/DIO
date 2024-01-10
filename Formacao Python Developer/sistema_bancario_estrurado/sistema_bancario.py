menu = """

====== Olá, seja bem-vindo! ======

        [d] Depositar
        [s] Sacar
        [e] Extrato
        [q] Sair

=> """

saldo = 0
limite = 500
extrato = ""
numero_saques = 0
LIMITE_SAQUES = 3

while True:

    opcao = input(menu)

    if opcao == "d":
        valor = float(input("Informe o valor do depósito: "))

        if valor > 0:
            saldo += valor
            print(f"O valor de R$: {valor:.2f} foi depositado com sucesso.")
            extrato += f"Depósito: R$ {valor:.2f}\n"

        else:
            print("Falha na operação! O valor informado é inválido.")

    elif opcao == "s":
        valor = float(input("Informe o valor do saque: "))

        excedeu_saldo = valor > saldo

        excedeu_limite = valor > limite

        excedeu_saques = numero_saques >= LIMITE_SAQUES

        if excedeu_saldo:
            print("Falha na operação! Você não tem saldo suficiente.")

        elif excedeu_limite:
            print("Falha na operação! O valor do saque excede o limite de R$: 500.00.")

        elif excedeu_saques:
            print("Falha na operação! O limite de 3 saques diários foi excedido.")

        elif valor > 0:
            saldo -= valor
            extrato += f"Saque: R$ {valor:.2f}\n"
            numero_saques += 1
            print(f"Valor de R$: {valor:.2f} foi sacado com sucesso!")

        else:
            print("Operação falhou! O valor informado é inválido.")

    elif opcao == "e":
        print("\n================ EXTRATO ================")
        print("Não foram realizadas movimentações." if not extrato else extrato)
        print(f"\nSaldo: R$ {saldo:.2f}")
        print("==========================================")

    elif opcao == "q":
        break

    else:
        print("Operação inexistente! Por favor selecione novamente uma operação válida.")