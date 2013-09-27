require 'spec_helper'

feature "Friend" do
  before do
    FactoryGirl.create :friend
    ensure_on friends_path
  end

  scenario 'Creating a new' do
    click_link 'Novo'

    fill_in 'Nome', :with => 'Joe'
    fill_in 'Latitude', :with => '9999'
    fill_in 'Longitude', :with => '888'

    click_button 'Criar Amigo'

    expect(page).to have_content('Amigo criado com sucesso.')
    expect(page).to have_content('Joe')
  end

  scenario 'Edit' do

    click_link 'Editar'

    fill_in 'Nome', :with => 'Joe 2'
    fill_in 'Latitude', :with => '9999'
    fill_in 'Longitude', :with => '777'

    click_button 'Atualizar Amigo'

    expect(page).to have_content('Amigo atualizado com sucesso.')
    expect(page).to have_content('Joe 2')

  end

  scenario 'Deleting a friend' do

    click_link 'Excluir', :confirm => true

    expect(page).to have_content('Amigo excluído com sucesso.')
  end

end
