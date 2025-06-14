// Function to calculate estimated reading time
function calculateReadingTime(articleContentElementId) {
    const wordsPerMinute = 200; // Average reading speed
    const articleElement = document.getElementById(articleContentElementId);

    if (!articleElement) {
        console.warn("Article content element not found for reading time calculation.");
        return "N/A";
    }

    const text = articleElement.textContent || articleElement.innerText || "";
    const wordCount = text.split(/\s+/).filter(word => word.length > 0).length;

    if (wordCount === 0) {
        return "1 min read"; // Or handle as preferred for empty content
    }

    const minutes = Math.ceil(wordCount / wordsPerMinute);
    return minutes + " min read";
}
