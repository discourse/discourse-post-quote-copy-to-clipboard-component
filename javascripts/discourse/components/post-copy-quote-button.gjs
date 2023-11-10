import Component from "@glimmer/component";
import I18n from "discourse-i18n";
import { action } from "@ember/object";
import { on } from "@ember/modifier";
import DButton from "discourse/components/d-button";
import { clipboardCopy } from "discourse/lib/utilities";
import { inject as service } from "@ember/service";

export default class PostCopyQuoteButton extends Component {
  @service toasts;

  @action
  async copyQuoteToClipboard() {
    const text = await this.args.outletArgs.data.buildQuote();
    clipboardCopy(text);
    this.toasts.success({
      duration: 3000,
      data: { message: I18n.t(themePrefix("post.quote_copied_to_clibboard")) },
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
