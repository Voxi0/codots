const fs = require('fs');
const path = require('path');

async function build() {
  const { marked } = await import('marked');
  const hljs = await import('highlight.js');

  marked.setOptions({
    highlight: function(code, lang) {
      const language = (lang === 'nix' || hljs.default.getLanguage(lang)) ? lang : 'plaintext';
      return hljs.default.highlight(code, { language }).value;
    },
    langPrefix: 'hljs language-'
  });

  const docsDir = 'docs';
  const outputDir = 'site';

  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir);
  }

  const files = fs.readdirSync(docsDir).filter(f => f.endsWith('.md'));

  const sections = files.map(f => {
    const content = fs.readFileSync(path.join(docsDir, f), 'utf-8');
    const html = marked.parse(content);
    const name = f.replace('.md', '');
    return { name, html, filename: f };
  });

  const menu = sections.map(s => `<li><a href="${s.filename.replace('.md', '.html')}">${s.name}</a></li>`).join('\n      ');

  const template = fs.readFileSync('template.html', 'utf-8');

  sections.forEach(section => {
    const page = template
      .replace('{{title}}', section.name)
      .replace('{{menu}}', menu)
      .replace('{{content}}', section.html);
    
    fs.writeFileSync(path.join(outputDir, section.filename.replace('.md', '.html')), page);
  });
  
  // Copy assets if they exist
  if (fs.existsSync('assets')) {
      const outputAssets = path.join(outputDir, 'assets');
      if (!fs.existsSync(outputAssets)) fs.mkdirSync(outputAssets);
      fs.readdirSync('assets').forEach(file => {
          fs.copyFileSync(path.join('assets', file), path.join(outputAssets, file));
      });
  }
}

build();