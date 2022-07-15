# feature 'Viewing Peeps' do
#     scenario 'A user can see messages' do
#         visit('/homepage')
        
#         expect(page).to have_content "look at my new car!"
#         expect(page).to have_content "Check out my new puppy!"
#         expect(page).to have_content "Look at the sky today!"
#     end
# end

    require 'peeps'
    
    describe Peeps do
      describe '.all' do
         it 'returns all peeps' do
           all_peeps = Peeps.all 
           
           expect(all_peeps).to include("look at my new car!")
           expect(all_peeps).to include("Check out my new puppy!")
           expect(all_peeps).to include("Look at the sky today!")
         end
        end
    end








