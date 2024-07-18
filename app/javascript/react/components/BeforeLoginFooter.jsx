import React from "react"

const BeforeLoginFooter = () => {
    return (
        <footer class='bg-silver p-4 text-white md:p-6'>
            <nav class='container mx-auto'>
                <div class='flex justify-between mx-auto container items-center'>
                <div><a href="/" className="text-xl md:text-3xl font-bold">TackleMaster</a></div>
                <ul class='flex space-x-6'>
                    <li>
                        <%= link_to 'https://github.com/rei-dev99/TackleMaster' do %>
                            <i class="fa-brands fa-github text-blue text-xl hover:opacity-70 transition-all duration-300"></i>
                        <% end %>
                    </li>
                    <li>
                        <%= link_to 'https://twitter.com/ida09r' do %>
                            <i class="fa-brands fa-x-twitter text-blue text-xl hover:opacity-70 transition-all duration-300"></i>
                        <% end %>
                    </li>
                    <li>
                        <%= link_to 'https://www.instagram.com/rei_webcreative/' do %>
                            <i class="fa-brands fa-instagram text-blue text-xl hover:opacity-70 transition-all duration-300"></i>
                        <% end %>
                    </li>
                </ul>
                </div>
                <div class='flex flex-col mx-auto container mt-2 md:justify-between md:flex-row md:mt-6'>
                <ul class='flex flex-wrap font-bold justify-between text-sm md:text-base space-x-0 md:space-x-6'>
                    <li><%= link_to t('footer.contact'), 'https://docs.google.com/forms/d/e/1FAIpQLScL-iN4VsmofpoysNffvmbGMVUPAZTgsvtGoIPGMjQys7DBWQ/viewform', class: 'md:text-lg text-sm font-bold hover:opacity-70 transition-all duration-300' %></li>
                    <li><%= link_to t('footer.terms_of_service'), terms_of_service_path, class: 'md:text-lg text-sm font-bold hover:opacity-70 transition-all duration-300' %></li>
                    <li><%= link_to t('footer.privacy_policy'), privacy_policy_path, class: 'md:text-lg text-sm font-bold hover:opacity-70 transition-all duration-300' %></li>
                </ul>
                <div class='text-center text-sm md:text-base mt-2 md:mt-0'><p>&copy; 2024 Tackle Master</p></div>
                </div>
            </nav>
        </footer>
    );
};

export default BeforeLoginFooter;