require 'spec_helper'

describe Visit do
    before :each do
        @visit = Visit.new 5.93357833962, 95.6812831872, Date.parse('2017-02-01 8:32:42'), Date.parse('2017-02-01 8:32:42')
    end

    describe '#new' do
        it 'takes 4 parameters and returns a Visit object' do
            expect(@visit).to be_an_instance_of Visit
        end
    end

    describe '#latitude' do
        it 'returns the correct latitude' do
            expect(@visit.latitude).to eql 5.93357833962
        end
    end

    describe '#longitude' do
        it 'returns the correct longitude' do
            expect(@visit.longitude).to eql 95.6812831872
        end
    end
end
