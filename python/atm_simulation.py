class ATM:
    def __init__(self, account_holder, initial_balance=0):
        self.account_holder = account_holder
        self.balance = float(initial_balance)
        self.transaction_history = []

    def check_balance(self):
        print(f"\nAccount Holder: {self.account_holder}")
        print(f"Current Balance: ${self.balance:.2f}")
        self.transaction_history.append("Checked balance")

    def deposit(self, amount):
        if amount <= 0:
            print("Deposit amount must be positive.")
            return
        self.balance += amount
        self.transaction_history.append(f"Deposited ${amount:.2f}")
        print(f"Successfully deposited ${amount:.2f}")

    def withdraw(self, amount):
        if amount <= 0:
            print("Withdrawal amount must be positive.")
            return
        if amount > self.balance:
            print("Insufficient funds.")
            return
        self.balance -= amount
        self.transaction_history.append(f"Withdrew ${amount:.2f}")
        print(f"Successfully withdrew ${amount:.2f}")

    def show_history(self):
        print("\n--- Transaction History ---")
        if not self.transaction_history:
            print("No transactions yet.")
        else:
            for i, txn in enumerate(self.transaction_history, 1):
                print(f"{i}. {txn}")

def main():
    print("=== Welcome to Python ATM ===")
    name = input("Enter account holder name: ")
    atm = ATM(name, initial_balance=1000)  # starting with $1000 for demo

    while True:
        print("\n--- Menu ---")
        print("1. Check Balance")
        print("2. Deposit")
        print("3. Withdraw")
        print("4. Transaction History")
        print("5. Exit")

        choice = input("Choose an option: ")

        if choice == "1":
            atm.check_balance()
        elif choice == "2":
            try:
                amt = float(input("Enter amount to deposit: $"))
                atm.deposit(amt)
            except ValueError:
                print("Invalid amount. Please enter a number.")
        elif choice == "3":
            try:
                amt = float(input("Enter amount to withdraw: $"))
                atm.withdraw(amt)
            except ValueError:
                print("Invalid amount. Please enter a number.")
        elif choice == "4":
            atm.show_history()
        elif choice == "5":
            print("Thank you for using Python ATM. Goodbye!")
            break
        else:
            print("Invalid choice. Try again.")

if __name__ == "__main__":
    main()
