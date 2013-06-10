require 'spec_helper'

describe Event do
  context "必須項目が入力されてない場合" do
    let(:event) { Event.new title: 'test', date: Date.today, time: '14:00 - 16:00'}

    it "日付が空の場合保存されない" do
      expect {
        event.date = nil
        event.save
      }.to change(Event, :count).by(0)
    end

    it "時間が空の場合保存されない" do
      expect {
        event.time = nil
        event.save
      }.to change(Event, :count).by(0)
    end
  end
end
