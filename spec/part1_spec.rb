# frozen_string_literal: true

describe 'การแนะนำ Ruby ส่วนที่ 1' do
  describe '#sum' do
    it 'ควรถูกกำหนด' do
      expect { sum([1, 3, 4]) }.not_to raise_error
    end

    it 'คืนค่าผลรวมที่ถูกต้อง [20 คะแนน]', points: 20 do
      expect(sum([1, 2, 3, 4, 5])).to be_a_kind_of Integer
      expect(sum([1, 2, 3, 4, 5])).to eq(15)
      expect(sum([1, 2, 3, 4, -5])).to eq(5)
      expect(sum([1, 2, 3, 4, -5, 5, -100])).to eq(-90)
    end

    it 'ทำงานกับอาร์เรย์ที่ว่าง [10 คะแนน]', points: 10 do
      expect { sum([]) }.not_to raise_error
      expect(sum([])).to be_zero
    end
  end

  describe '#max_2_sum' do
    it 'ควรถูกกำหนด' do
      expect { max_2_sum([1, 2, 3]) }.not_to raise_error
    end

    it 'คืนค่าผลรวมที่ถูกต้อง [7 คะแนน]', points: 7 do
      expect(max_2_sum([1, 2, 3, 4, 5])).to be_a_kind_of Integer
      expect(max_2_sum([1, 2, 3, 4, 5])).to eq(9)
      expect(max_2_sum([1, -2, -3, -4, -5])).to eq(-1)
    end

    it 'ทำงานได้แม้ค่าสองค่าที่มากที่สุดจะเหมือนกัน [3 คะแนน]', points: 3 do
      expect(max_2_sum([1, 2, 3, 3])).to eq(6)
    end

    it 'คืนค่าศูนย์หากอาร์เรย์ว่าง [10 คะแนน]', points: 10 do
      expect(max_2_sum([])).to be_zero
    end

    it 'คืนค่าขององค์ประกอบหากมีเพียงหนึ่งองค์ประกอบ [10 คะแนน]', points: 10 do
      expect(max_2_sum([3])).to eq(3)
    end
  end

  describe '#sum_to_n' do
    it 'ควรถูกกำหนด' do
      expect { sum_to_n?([1, 2, 3], 4) }.not_to raise_error
    end

    it 'คืนค่าเป็น true เมื่อมีสององค์ประกอบที่มีผลรวมเท่ากับอาร์กิวเมนต์ที่สอง [30 คะแนน]', points: 30 do
      expect(sum_to_n?([1, 2, 3, 4, 5], 5)).to be true # 2 + 3 = 5
      expect(sum_to_n?([3, 0, 5], 5)).to be true # 0 + 5 = 5
      expect(sum_to_n?([-1, -2, 3, 4, 5, -8], -3)).to be true  # จัดการกับผลรวมที่เป็นลบ
      expect(sum_to_n?([-1, -2, 3, 4, 5, -8], 12)).to be false # 3 + 4 + 5 = 12 (ไม่มีองค์ประกอบ 3 ตัว)
      expect(sum_to_n?([-1, -2, 3, 4, 6, -8], 12)).to be false # ไม่มีองค์ประกอบสององค์ประกอบที่มีผลรวม
    end

    it 'คืนค่าเป็น false สำหรับอาร์เรย์ที่มีองค์ประกอบเดียว [5 คะแนน]', points: 5 do
      expect(sum_to_n?([0], 0)).to be false
      expect(sum_to_n?([1], 1)).to be false
      expect(sum_to_n?([-1], -1)).to be false
      expect(sum_to_n?([-3], 0)).to be false
    end

    it 'คืนค่าเป็น false สำหรับอาร์เรย์ว่าง [5 คะแนน]', points: 5 do
      expect(sum_to_n?([], 0)).to be false
      expect(sum_to_n?([], 7)).to be false
    end
  end
end
