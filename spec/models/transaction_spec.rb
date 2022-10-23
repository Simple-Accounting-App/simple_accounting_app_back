# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '#validations' do
    before(:all) do
      usr = create(:user)
      @acc1 = create(:account, user: usr, initial_amount: 1000)
      @acc2 = create(:account, user: usr, initial_amount: 0)
      @transaction = Transaction.new(
        debit_account: @acc1,
        credit_account: @acc2,
        amount: 100,
        transfer_date: Time.now
      )
      puts @transaction.inspect
    end

    it 'is valid with valid attributes' do
      expect(@transaction).to be_valid
    end

    context 'when missing an attribute' do
      it 'is not valid without a credit account' do
        @transaction.credit_account_id = nil
        expect(@transaction).to_not be_valid
        @transaction.credit_account = @acc2
      end
      it 'is not valid without a debit account' do
        @transaction.debit_account_id = nil
        expect(@transaction).to_not be_valid
        @transaction.debit_account = @acc1
      end
      it 'is not valid without an amount' do
        @transaction.amount = nil
        expect(@transaction).to_not be_valid
        @transaction.amount = 100
      end
      it 'is not valid without a transfer date' do
        @transaction.transfer_date = nil
        expect(@transaction).to_not be_valid
        @transaction.transfer_date = Time.now
      end
    end

    context 'when adding wrong formated amounts' do
      it 'is not valid with a string as an amount' do
        @transaction.amount = 'test'
        expect(@transaction).to_not be_valid
      end
      it 'is not valid with 0 as a amount' do
        @transaction.amount = 0
        expect(@transaction).to_not be_valid
      end
      it 'is not valid with a negative number as a amount' do
        @transaction.amount = -1000
        expect(@transaction).to_not be_valid
        @transaction.amount = 100
      end
    end

    context 'when adding wrong accounts' do
      it 'is not valid without an existing credit account' do
        @transaction.credit_account_id = -1
        expect(@transaction).to_not be_valid
        @transaction.credit_account = @acc2
      end
      it 'is not valid without an existing debit account' do
        @transaction.debit_account_id = -1
        expect(@transaction).to_not be_valid
        @transaction.debit_account = @acc1
      end
      it 'is not valid if same credit and debit account' do
        @transaction.credit_account = @transaction.debit_account
        expect(@transaction).to_not be_valid
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
