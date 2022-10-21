# rubocop:disable Metrics/BlockLength, Layout/LineLength
require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:user1) { create(:user, name: 'Obélix') }
  let(:user2) { create(:user, name: 'Astérix') }

  let(:user1_account) { create(:account, user: user1, initial_amount: 5000) }
  let(:user2_account) { create(:account, user: user2, initial_amount: 0) }

  describe '#current_amount' do
    context 'when no transactions occurred' do
      it 'should return the initial amount - case with initial amount' do
        expect(user1_account.current_amount).to eq(5000)
      end
      it 'should return the initial amount - case no initial amount' do
        expect(user2_account.current_amount).to eq(0)
      end
    end

    context 'when a transaction occurred after today' do
      before do
        create(
          :transaction, debit_account: user1_account, credit_account: user2_account, amount: 1000, transfer_date: Time.now + 2.days
        )
      end
      it 'should not change for debitor' do
        expect(user1_account.current_amount).to eq(5000)
      end
      it 'should not change creditor' do
        expect(user2_account.current_amount).to eq(0)
      end
    end

    context 'when a transaction occurred today' do
      before do
        create(
          :transaction, debit_account: user1_account, credit_account: user2_account, amount: 1000, transfer_date: Time.now
        )
      end
      it 'should substract the transaction amount to debitor' do
        expect(user1_account.current_amount).to eq(4000)
      end
      it 'should add the transaction amount to creditor' do
        expect(user2_account.current_amount).to eq(1000)
      end
    end

    context 'when a transaction occurred before today' do
      before do
        create(
          :transaction, debit_account: user1_account, credit_account: user2_account, amount: 1000, transfer_date: Time.now - 2.days
        )
      end
      it 'should substract the transaction amount to debitor' do
        expect(user1_account.current_amount).to eq(4000)
      end
      it 'should add the transaction amount to creditor' do
        expect(user2_account.current_amount).to eq(1000)
      end
    end

    context 'when several transactions occurred' do
      before do
        create(
          :transaction, debit_account: user1_account, credit_account: user2_account, amount: 1000, transfer_date: Time.now - 2.days
        )
        create(
          :transaction, debit_account: user1_account, credit_account: user2_account, amount: 2500, transfer_date: Time.now - 1.days
        )
        create(
          :transaction, debit_account: user2_account, credit_account: user1_account, amount: 150, transfer_date: Time.now
        )
        create(
          :transaction, debit_account: user1_account, credit_account: user2_account, amount: 200, transfer_date: Time.now + 2.days
        )
      end
      it 'should return summed amount for main debitor' do
        expect(user1_account.current_amount).to eq(1650)
      end
      it 'should return summed amount for main creditor' do
        expect(user2_account.current_amount).to eq(3350)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength, Layout/LineLength
