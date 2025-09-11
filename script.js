// Giscus Comments Integration
function loadGiscusComments() {
    // Check if we're on a blog post page (not home or about)
    const isArticlePage = document.querySelector('.article-content');
    
    if (isArticlePage) {
        // Create comments section if it doesn't exist
        let commentsSection = document.querySelector('.comments-section');
        
        if (!commentsSection) {
            commentsSection = document.createElement('section');
            commentsSection.className = 'comments-section';
            
            const commentsTitle = document.createElement('h3');
            commentsTitle.textContent = 'Comments';
            commentsSection.appendChild(commentsTitle);
            
            // Insert before nav-links
            const navLinks = document.querySelector('.nav-links');
            navLinks.parentNode.insertBefore(commentsSection, navLinks);
        }
        
        // Create and configure Giscus script
        const script = document.createElement('script');
        script.src = 'https://giscus.app/client.js';
        script.setAttribute('data-repo', 'vasuadari/vasuadari.github.io');
        script.setAttribute('data-repo-id', 'MDEwOlJlcG9zaXRvcnkzMjY2NTczOQ==');
        script.setAttribute('data-category', 'General');
        script.setAttribute('data-category-id', 'DIC_kwDOAfJwi84CvT3u');
        script.setAttribute('data-mapping', 'pathname');
        script.setAttribute('data-strict', '0');
        script.setAttribute('data-reactions-enabled', '1');
        script.setAttribute('data-emit-metadata', '0');
        script.setAttribute('data-input-position', 'bottom');
        script.setAttribute('data-theme', 'light');
        script.setAttribute('data-lang', 'en');
        script.setAttribute('crossorigin', 'anonymous');
        script.async = true;
        
        // Append script to comments section
        commentsSection.appendChild(script);
    }
}

// Load comments when DOM is ready
document.addEventListener('DOMContentLoaded', loadGiscusComments);
