# TFHelps

> TFHelps is a command-line tool designed to format text files professionally and efficiently. Built primarily for **Helps Ministries**, it uses the Gemini API to clean up and structure text based on predefined formatting guidelines. This tool is ideal for anyone looking to automate the process of making text more readable and polished.

## Installation

Run this command to install the gem:

```bash
gem install tfhelps
```

## Usage

### Prerequisites

Before using TFHelps, you need to obtain an API key from Google's AI Studio. Follow these steps:

1. Visit Google AI Studio and sign in with your Google account.
2. Generate an API key (free or paid, depending on your usage needs).
3. Store the API key in your environment variables with the key GEMINI_API_KEY.
   Add the following line to your .bashrc, .zshrc, or equivalent shell configuration file:

```bash
export GEMINI_API_KEY="your_api_key_here"
```

4. Restart your terminal or run `source ~/.bashrc` (or equivalent) to apply the changes.

### Running the Tool

To format a text file, use the following command:

```bash
tfhelps path/to/your/textfile.txt
```

The tool will process the file and output the formatted text to a new text file in the current directory.

### Formatting Guidelines

TFHelps follows these rules to format your text:

1. Combine sentences into a single paragraph if they are separated by a single empty line.
2. Create a new paragraph whenever there are two or more empty lines separating the text.
3. Ensure proper spacing, punctuation, and capitalization throughout the text.
4. Maintain a clean and polished format suitable for professional use.

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/wuletawwonte/tfhelps>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/wuletawwonte/tfhelps/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tfhelps project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/wuletawwonte/tfhelps/blob/master/CODE_OF_CONDUCT.md).
