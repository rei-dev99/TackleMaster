import React from "react"

const CommonSNSLinks = () => {
    return (
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
    );
};

export default CommonSNSLinks;