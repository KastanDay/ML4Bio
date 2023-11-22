import torch
import torch.nn as nn

# Define the Transformer Decoder class

class TransformerDecoder(nn.Module):
    def __init__(self, d_model, nhead, num_layers, dim_feedforward):
        super(TransformerDecoder, self).__init__()
        self.decoder_layer = nn.TransformerDecoderLayer(d_model, nhead, dim_feedforward)
        self.transformer_decoder = nn.TransformerDecoder(self.decoder_layer, num_layers)

    def forward(self, tgt, memory):
        output = self.transformer_decoder(tgt, memory)
        return output