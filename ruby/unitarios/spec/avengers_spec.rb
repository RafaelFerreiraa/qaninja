class AvengersHeadQuarter

    attr_accessor :list

    def initialize
        self.list = []
    end

    def put(avenger)
        self.list.push(avenger)
    end
end
# TDD (DESENVOLVIMENTO GUIADO POR TESTES)
describe AvengersHeadQuarter do
    it 'Deve adicionar um vingador' do
        hq = AvengersHeadQuarter.new

        hq.put('Spiderman')
        expect(hq.list).to eql ['Spiderman']
    end

    it 'Deve adicionar uma lista' do
        hq = AvengersHeadQuarter.new

        hq.put('Spiderman')
        hq.put('hulk')
        hq.put('thor')

        res = hq.list.size > 0

        expect(hq.list).to include 'hulk'
        expect(hq.list.size).to be > 0
        expect(res).to be true
    end

    it 'Thor deve ser o primeiro da lista' do
        hq = AvengersHeadQuarter.new

        hq.put('thor')
        hq.put('Spiderman')
        hq.put('hulk')

        expect(hq.list).to start_with('thor')
    end

    it 'hulk deve ser o último da lista' do
        hq = AvengersHeadQuarter.new

        hq.put('thor')
        hq.put('Spiderman')
        hq.put('hulk')

        expect(hq.list).to end_with('hulk')
    end

    it 'Deve conter o sobrenome' do
        avenger = 'Peter Parker'

        expect(avenger).to match(/Parker/)
        expect(avenger).not_to match(/teste/)
    end
end