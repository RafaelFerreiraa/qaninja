class AvengersHeadQuarter
    attr_accessor :list

    def initialize
        self.list = []
    end

    def put(avenger)
        self.list.push(avenger)
    end
end

describe AvengersHeadQuarter do
    it 'Deve adicionar um parceiro' do
        hq = AvengersHeadQuarter.new

        hq.put('Spiderman')
        expect(hq.list).to eql ['Spiderman']
    end

    it 'Deve adicionar uma lista' do
        hq = AvengersHeadQuarter.new

        hq.put('Spiderman')
        hq.put('hulk')
        hq.put('thor')

        expect(hq.list).to include 'hulk'
        expect(hq.list.size).to be > 0
        
    end
end