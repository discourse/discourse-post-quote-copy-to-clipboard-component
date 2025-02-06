import Component from "@glimmer/component";
import { on } from "@ember/modifier";
import { action } from "@ember/object";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";
import { clipboardCopy } from "discourse/lib/utilities";
import { i18n } from "discourse-i18n";

export default class PostCopyQuoteButton extends Component {
  @service toasts;

  @action
  async copyQuoteToClipboard() {
    const text = await this.args.outletArgs.data.buildQuote();
    clipboardCopy(text);
    this.toasts.success({
      duration: 3000,
      data: { message: i18n(themePrefix("post.quote_copied_to_clibboard")) },
    });
    await this.args.outletArgs.data.hideToolbar();
  }

  <template>
    <DButton
      @icon="copy"
      @label={{themePrefix "post.quote_copy"}}
      {{on "click" this.copyQuoteToClipboard}}
      class="btn-flat"
    />
  </template>
}
